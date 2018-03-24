#!/usr/bin/env python3
"""
Serial: 20180313-004

Some parts were lifted from example code from Amazon AWS.

Original copyright below:
========================================================================
Copyright 2017 Amazon.com, Inc. or its affiliates.
All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License").
You may not use this file except in compliance with the License.
A copy of the License is located at

http://aws.amazon.com/apache2.0/

or in the "license" file accompanying this file.
This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied. See the License for
the specific language governing permissions and limitations under the
License.
========================================================================

This script creates the detectors in member accounts in each region.
It will look for an invite from a master account, in each region, and if
found will then accept the invitation.

Operation:

  update 'aws_regions_list' for desired regions
  this operates within the context of the member

  prereq:
    master account must have invited member account in each region

  Example command line:

    AWS_PROFILE=memberprofile ./gd-member-accept.py --master 123456789012

"""

from __future__ import print_function
from botocore.exceptions import ClientError
import argparse
import logging
import boto3
import hcl
import json
import sys

# Command line arguments
parser = argparse.ArgumentParser(
    description='Accept AWS GuardDuty invitation')
parser.add_argument('--master', dest='master_account', required=True)
args = parser.parse_args()

# Start logging
logger = logging.basicConfig()
logger = logging.getLogger('index')
logger.setLevel('DEBUG')

# GuardDuty is not yet available:
#  Paris Region (eu-west-3) is new and not supported yet
unsupported_regions = ['eu-west-3']


def main():
  # Loop through the regions and perform the GuardDuty Setup
  member_region_loop(args.master_account)


def member_region_loop(master_account):
  # read out the region list from the Terraform variables.tf file
  with open('variables.tf') as fp:
    obj = hcl.load(fp)
    aws_regions_list = obj['variable']['region_list']['default']

  for aws_region in aws_regions_list:

    if aws_region not in unsupported_regions:

      logger.debug('Executing in {region}'.format(region=aws_region))

      guardduty = boto3.client('guardduty', region_name=aws_region)

      # get detectors for this region
      detector_dict = list_detectors(guardduty, aws_region)
      detector_id = detector_dict[aws_region]

      # Check if a detector exists
      # If detector does not exist, then create it
      if detector_id:

        # A detector exists
        logger.debug('Found existing detector {detector} in {region}'.format(
            detector=detector_id, region=aws_region
        ))

      else:

        # create a detector
        detector_id = create_detector(guardduty)

        logger.debug('Created detector {detector} in {region}'.format(
            detector=detector_id, region=aws_region
        ))

      # Now we should have a detector
      # Get the invitation, if there is an invite
      invite = get_invite(guardduty, master_account)

      # If there is an invite, then accept it
      # If not, then report that
      if invite:

        # Accept the invite
        response = accept(guardduty, invite, detector_id)

        if response is True:
          logger.debug('Accepted invitation in {region}'.format(
              region=aws_region
          ))

        else:
          logger.error('{error}'.format(error=response))
          sys.exit("ERROR")

      # No matching invite to accept
      else:

        # Report that there was not a matching invite to accept
        logger.debug('There is no invitation for {region}, '
                     'or the invite is not from account {master}'.format(
                         region=aws_region, master=master_account
                     ))

    else:
      logger.debug('Region does not have GuardDuty. '
                   'Skipping region {region}'.format(
                       region=aws_region
                   ))


def create_detector(client):
  response = client.create_detector(Enable=True)
  detector_id = response['DetectorId']
  return detector_id


def list_detectors(client, aws_region):
  detector_dict = client.list_detectors()

  # check if it exists
  if detector_dict['DetectorIds']:

    # there should only be one detector
    # but loop in case this changes in future
    for detector in detector_dict['DetectorIds']:
      detector_dict.update({aws_region: detector})
  else:
    detector_dict.update({aws_region: ''})

  return detector_dict


def get_invite(client, master_account):
  invites = client.list_invitations()

  # Check if the response is formatted as expected
  if 'Invitations' in invites:

    # Loop through each invite, if multiple
    for invite in invites['Invitations']:

      # Verify the account ID matches Master Account ID parameter
      if invite['AccountId'] == master_account:
        return invite
      else:
        return False
  else:
    return False


def accept(client, invite, detector_id):
  try:
    response = client.accept_invitation(
        DetectorId=detector_id,
        InvitationId=invite['InvitationId'],
        MasterId=invite['AccountId']
    )
    return True

  except ClientError as e:
    return e


if __name__ == "__main__":
  main()

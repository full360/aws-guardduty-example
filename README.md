# Build out AWS GuardDuty

This uses the following to accomplish the tasks
- [Terraform](https://terraform.io/) with [CloudFormation](https://aws.amazon.com/cloudformation/)
  - Terraform creates and maintains state
  - CloudFormation within Terraform because of maturity issues in Terraform dealing with `aws_guardduty_*` resources for `create_member()` and `invite_member()` AWS SDK functions
- Python (either Python2 or Python3 - using Python3 at the moment)

This does not implement
- SNS topic for alerting
- Lambda functions for alerting
- well.. any alerting functionality
- IPSet whitelisting (example in [ToDo](TODO.md))
- ThreatIntelSet blacklisting (example in [ToDo](TODO.md))

## Status
Terraform is still immature in terms of swapping contexts in the middle of a run creating problems with state storage and shared configuration items when working within multiple, account-contextual situations.

Terraform is also missing the `create_invite()` and `accept_invite()` API calls (as of 1.11 of the AWS provider) so we need to drop to Python at some point anyway.

This maturity level means that I implemented the actual member creation and invite via CloudFormation stack per region per member. A single stack creation actually creates the member and sends the invite for later processing via Python.

## Variable used for all steps
Edit the file `requirements.tf` and set the list variable `region_list` to the regions you wish to enable AWS GuardDuty in. This affects the master and member accounts and is used in all steps of implementation.

## Steps to accomplish master account setup
You'll need an S3 bucket to store the terraform state file. You have two options: Create a bucket for such storage **or** utilize an existing bucket.
  1. create s3 bucket in master account **if needed**
    - if a bucket is required
      - `cd s3`
      - **only local state is stored**
          - option 1: once created add a `backend.tf` to reference the bucket if wanted
          - option 2: do creation via CloudFormation
          - option 3: not worry about it
      - edit `s3.tf` and make sure `bucket name` is set correctly
          - remember this name as it is used **elsewhere**!
      - edit `variables.tf` and set `master_account_id` correctly as this is used **elsewhere** including the final python script as a parameter
      - edit `s3.tf` and review the policy; make sure all accounts are applied for access to bucket then run:
          - `terraform init`
          - `terraform plan`
          - `terraform apply`
    - if using an **existing** `bucket` then make note of the name

  2. create master detectors in REGION
    - change context to **master account**
    - `cd master`
    - edit `backend.tf` and set `bucket name` to match above then run the following commands:
      - `terraform init`
      - `terraform plan`
      - `terraform apply`

  3. create & invite member in REGION
    - `cd members`
    - edit `backend.tf` and set `bucket name` to match above
    - copy `TEMPLATE-MEMBER.txt` to `gd-member-<member-id>.tf`
    - edit `gd-member-<member-id>.tf`
      - find/replace `MEMBERID` with `<member-id>` account number
      - find/replace `MEMBEREMAIL` with `<root-email>` email address
      - run the following commands:
         - `terraform init`
         - `terraform plan`
         - `terraform apply`

## Steps to accomplish member account setup
### Python script uses the terraform `variables.tf` file to figure out which regions to operate in

 1. create member detector, accept invite in REGION
    - **state is not stored as this operation is idempotent**
    - script requires `boto3`, `ply`, `pyhcl`
    - `cd members`
      - `./gd-member-accept.py --master <master_id>`

# Folder Layout
```
./                   base AWS files
  ./data.tf          terraform data structures
  ./requirements.tf  terraform plugin version minimums
  ./variables.tf     terraform variables used throughout
./master             terraform code used for the master account
./members            terraform code used for the member accounts

../s3/               terraform bucket creation if needed
```
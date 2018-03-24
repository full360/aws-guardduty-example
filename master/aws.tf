# master

provider aws {
  alias               = "master-ap-south-1"
  allowed_account_ids = ["${var.master_account_id}"]
  region              = "ap-south-1"
  version             = "~> 1.9"
}

provider aws {
  alias               = "master-eu-west-3"
  allowed_account_ids = ["${var.master_account_id}"]
  region              = "eu-west-3"
  version             = "~> 1.9"
}

provider aws {
  alias               = "master-eu-west-2"
  allowed_account_ids = ["${var.master_account_id}"]
  region              = "eu-west-2"
  version             = "~> 1.9"
}

provider aws {
  alias               = "master-eu-west-1"
  allowed_account_ids = ["${var.master_account_id}"]
  region              = "eu-west-1"
  version             = "~> 1.9"
}

provider aws {
  alias               = "master-ap-northeast-2"
  allowed_account_ids = ["${var.master_account_id}"]
  region              = "ap-northeast-2"
  version             = "~> 1.9"
}

provider aws {
  alias               = "master-ap-northeast-1"
  allowed_account_ids = ["${var.master_account_id}"]
  region              = "ap-northeast-1"
  version             = "~> 1.9"
}

provider aws {
  alias               = "master-sa-east-1"
  allowed_account_ids = ["${var.master_account_id}"]
  region              = "sa-east-1"
  version             = "~> 1.9"
}

provider aws {
  alias               = "master-ca-central-1"
  allowed_account_ids = ["${var.master_account_id}"]
  region              = "ca-central-1"
  version             = "~> 1.9"
}

provider aws {
  alias               = "master-ap-southeast-1"
  allowed_account_ids = ["${var.master_account_id}"]
  region              = "ap-southeast-1"
  version             = "~> 1.9"
}

provider aws {
  alias               = "master-ap-southeast-2"
  allowed_account_ids = ["${var.master_account_id}"]
  region              = "ap-southeast-2"
  version             = "~> 1.9"
}

provider aws {
  alias               = "master-eu-central-1"
  allowed_account_ids = ["${var.master_account_id}"]
  region              = "eu-central-1"
  version             = "~> 1.9"
}

provider aws {
  alias               = "master-us-east-1"
  allowed_account_ids = ["${var.master_account_id}"]
  region              = "us-east-1"
  version             = "~> 1.9"
}

provider aws {
  alias               = "master-us-east-2"
  allowed_account_ids = ["${var.master_account_id}"]
  region              = "us-east-2"
  version             = "~> 1.9"
}

provider aws {
  alias               = "master-us-west-1"
  allowed_account_ids = ["${var.master_account_id}"]
  region              = "us-west-1"
  version             = "~> 1.9"
}

provider aws {
  alias               = "master-us-west-2"
  allowed_account_ids = ["${var.master_account_id}"]
  region              = "us-west-2"
  version             = "~> 1.9"
}

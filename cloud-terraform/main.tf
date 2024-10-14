terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
   
  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "traineeterraform"
    region = "ru-central1"
    key    = "terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true 

  }
}

provider "yandex" {
  cloud_id                 = "b1g5b020anchqspg6qul"
  zone                     = "ru-central1-b"
  folder_id                = "b1g3jagg302vglsnv5h6"
  service_account_key_file = "C:/Users/Philipp/authorized_key.json"

}

module "scgroup" {
  source = "./modules/secgroups"
}

module "instances" {
  source = "./modules/instances"
  SCGROUP_ID = module.scgroup.id
}

module "vpc" {
  source = "./modules/vpc"
}


module "db" {
  source = "./modules/db"
}

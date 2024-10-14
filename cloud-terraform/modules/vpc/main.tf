module "vpc" {
  source              = "github.com/terraform-yc-modules/terraform-yc-vpc"
  network_name        = "main-network"
  create_vpc          = true

  private_subnets = [{
    name           = "private"
    zone           = "ru-central1-b"
    v4_cidr_blocks = ["10.2.0.0/16"]
  },
  ]
   public_subnets = [
    {
      name           = "public"
      zone           = "ru-central1-b"
      v4_cidr_blocks = ["10.3.0.0/16"]
    },
  ]
}
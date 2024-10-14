module "db" {
  source = "github.com/terraform-yc-modules/terraform-yc-postgresql"

  network_id  = var.ids["NETWORK_ID"]
  name        = "main"
  environment = "PRODUCTION"


  hosts_definition = [
    {
      zone             = "ru-central1-b"
      subnet_id        = var.ids["SUBNET_ID"]
    }
  ]

  databases = [
    {
      name       = "testdb"
      owner      = "user"
      lc_collate = "ru_RU.UTF-8"
      lc_type    = "ru_RU.UTF-8"
    }
  ]

  owners = [
    {
      name       = "user"
    }
  ]
}

module "scgroup" {
  source     = "github.com/terraform-yc-modules/terraform-yc-security-group"
  name       = "maingroup"
  network_id = var.ids["NETWORK_ID"]

  ingress_rules_with_cidrs = [
    {
      description    = var.rule["name"]
      port           = 22
      protocol       = "TCP"
      v4_cidr_blocks = [var.rule["ip"]]
    },
  ]
  
  ingress_rules_with_sg_ids = [
  ]
  
  egress_rules = [
    {
      protocol       = "ANY"
      v4_cidr_blocks = [var.rule["ip"]]
    },
  ]
}
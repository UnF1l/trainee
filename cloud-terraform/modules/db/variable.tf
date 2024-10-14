variable "ids" {
  type = object({
    SUBNET_ID = string
    NETWORK_ID = string
  })
  default = {
    SUBNET_ID = "e2lr3371oljiq61fitdi"
    NETWORK_ID = "enpatv4k4dslh1r332ba"
  }
}
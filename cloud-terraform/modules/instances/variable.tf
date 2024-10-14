variable "ids" {
  type = object({
    IMAGE_ID = string
    SUBNET_ID = string
  })
  default = {
    IMAGE_ID = "fd8tvc3529h2cpjvpkr5"
    SUBNET_ID = "e2lr3371oljiq61fitdi"
  }
}
variable "SCGROUP_ID" {
  type = string
}
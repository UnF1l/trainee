variable "rule" {
  type = object({
    ip     = string
    name   = string
  })
  default = {
    "ip" = "95.174.98.252/32"
    "name" = "ssh"
  }
}
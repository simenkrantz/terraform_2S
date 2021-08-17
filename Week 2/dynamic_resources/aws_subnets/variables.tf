variable "region" {
  description = "Region used for AWS instances"
  type        = string
}

variable "subnets_map" {
  description = "Map used by 'for_each' for creating subnets"
  type = map(object({
    vpc_id = string
    cidr_block = string
  }))
}
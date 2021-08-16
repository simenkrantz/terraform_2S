variable "aws_region" {
  description = "Region for instances deployed from AWS Console"
  type        = string
  validation {
    condition     = length(var.aws_region) > 0
    error_message = "Variable 'aws_region' must be a nonempty string."
  }
}

variable "aws_ami" {
  description = "AMI ID for AWS instance"
  type        = string
  default     = "ami-03d5c68bab01f3496"
}

variable "aws_instance_id" {
  description = "Unique ID for AWS instance configured in Console"
  type        = string
  default     = "i-0c783eb22ca859d6d"
  sensitive   = true
}
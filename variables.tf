/** 
# NOTE: Variables
*/
variable "role_arn" {
  description = "AWS Assume Role ARN"
  default     = ""
}

variable "project" {
  type    = string
  default = ""
}

variable "environment" {
  type    = string
  default = ""
}

variable "domain_name" {
  type    = string
  default = ""
}

variable "acm_certificate_arn" {
  type    = string
  default = ""
}

variable "log_prefix" {
  type    = string
  default = ""
}

variable "default_cache_behavior" {
  type = object({
    viewer_protocol_policy = string
    min_ttl                = string
    default_ttl            = string
    max_ttl                = string

    forwarded_values = object({
      query_string = bool
      cookies = object({
        forward = string
      })
    })
  })
  default = {
    viewer_protocol_policy      = ""
    min_ttl                     = ""
    default_ttl                 = ""
    max_ttl                     = ""
    lambda_function_association = ""

    forwarded_values = {
      query_string = false
      cookies = {
        forward = "none"
      }
    }
  }
}

variable "custom_error_response_rules" {
  type = list(object({
    error_caching_min_ttl = number
    error_code            = number
    response_code         = number
    response_page_path    = string
    })
  )
}
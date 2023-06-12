variable "log_group_name" {
  description = "Name of the log group to be created."
  type        = string
}

variable "tags" {
  description = "tags to be added to sub resources"
  type        = map(string)
}

variable "retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group."
  type        = number
  default     = 30
}
variable "environment" {
  description = "The environment for the resource."
  default     = ""
  type        = string
}

variable "namespace" {
  description = "The namespace tag for the resource."
  default     = ""
  type        = string
}

variable "name" {
  description = "The main name for the resource."
  default     = "default"
  type        = string
}

variable "stage" {
  description = "The stage tag for the resource."
  default     = ""
  type        = string
}

variable "tags" {
  description = "Map of tags (e.g.: '{name=test,environment=dev}')."
  default     = {}
  type        = map(string)
}

variable "delimiter" {
  description = "The delimiter char that will be used to separate the fields in the resource id."
  default     = "-"
  type        = string
}

variable "id_tags_order" {
  description = "The list of fields (in order) that will be used for the resource id."
  default     = ["environment", "namespace", "name", "stage"]
  type        = list(string)
}

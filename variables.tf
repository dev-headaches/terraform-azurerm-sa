variable "enviro" {
  type        = string
  description = "define the environment ex. dev,tst,prd,stg"
}

variable "location" {
  type        = string
  description = "location of your resource group"
}

variable "rgname" {
  type        = string
  description = "the name of the resource group in which to deploy the resource groups"
}

variable "blob" {
  type = bool
  default = false
}

variable "pe" {
  type = bool
  default = false
}

variable "pesubnetid" {
  type        = string
  default = ""
}
/*
variable "prjname" {
  type        = string
  description = "define the project name ex. prj02"
}

variable "prjnum" {
  type        = string
  description = "define the project number for TFstate file ex. 4858"
}

variable "wrkldID" {
  type        = string
  description = "a name/tag/id for the workload being created"
}

variable "dmzsubnetID" {
  type        = string
  description = "The ID of the DMZ Subnet"
}

variable "intsubnetID" {
  type        = string
  description = "The ID of the INT Subnet"
}

variable "fwsubnetID" {
  type        = string
  description = "The ID of the AzureFirewall Subnet"
}

variable "fwpolicyID" {
  type        = string
  description = "The ID of the firewall policy to apply to this firewall"
}
*/
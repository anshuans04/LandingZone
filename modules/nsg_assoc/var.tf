variable "nic_ids" {
  description = "Map of NIC names to their resource IDs"
  type        = map(string)
}

variable "nsg_ids" {
  description = "Map of NSG keys to their resource IDs"
  type        = map(string)
}

variable "nic_nsg_map" {
  description = "Map of NIC key => NSG key"
  type        = map(string)
}
# 1. resource group variable
variable "rg_backend_name" {
  type        = string
  description = "Name of the resource group for the backen"
}
variable "rg_backend_location" {
  type        = string
  description = "Location of the resource group for the backend"
}

# 2. storage account variable
variable "sa_backend_name" {
  type        = string
  description = "Name of the storage account for the backend"
}

# 3. storage container variable 
variable "sc_backend_name" {
  type        = string
  description = "Name of the storage container for the backend"
}

# 4. key_vault variable
variable "kv_backend_name" {
  type        = string
  description = "kv name of the storage kv for the backend"
}

# 5. key_vault secret 
variable "sa_backend_accesskey_name" {
  type        = string
  description = "optional describe"
}
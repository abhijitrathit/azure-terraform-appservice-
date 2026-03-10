variable "resource_group_name" {
  description = "Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "service_plan_name" {
  description = "App Service Plan Name"
  type        = string
}

variable "app_name" {
  description = "App Service Name"
  type        = string
}

variable "sku_name" {
  description = "App Service SKU"
  type        = string
}

variable "java_version" {
  description = "Java version"
  type        = string
}

variable "tomcat_version" {
  description = "Tomcat version"
  type        = string
}

variable "catalina_opts" {
  description = "Tomcat Catalina options"
  type        = string
}

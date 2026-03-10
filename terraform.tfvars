resource_group_name = "my-rg"
location            = "Central India"

service_plan_name   = "abhijit-appservice-plan"
app_name            = "abhijit-tomcat-app123"

sku_name            = "B1"

java_version        = "17"
tomcat_version      = "10.0"

catalina_opts = "-Xms512m -Xmx1024m -Djava.security.egd=file:/dev/./urandom"

resource_group_name = "my-rg2"
location            = "Central India"

service_plan_name   = "abhijit-appservice-plan2"
app_name            = "abhijit-tomcat-app1234"

sku_name            = "B1"

java_version        = "17"
tomcat_version      = "10.0"

catalina_opts = "-Xms512m -Xmx1024m -Djava.security.egd=file:/dev/./urandom"

# Resource group and location
rg_name = "rg-operaterra-ecom"
location = "westeurope"

# Security and networking
sg_name = "nsg-operaterra-ecom"
ip_name = "pip-operaterra-ecom"
lb_name = "lb-operaterra-ecom"
vn_name = "vnet-operaterra-ecom"
subnet_name = "snet-operaterra-ecom"

# App services and database
service_plan_name = "asp-operaterra-ecom"
db_name = "sqldb-operaterra-ecom"
server_name = "sql-operaterra-ecom"
server_admin_pwd = "s3rvrpWd"
server_admin_username = "sqladm!n"

# Storage and service accounts
sb_name = "sb-operaterra-ecom"
sa_name = "saotecom"
sc_name = "sc-operaterra-ecom"

# VMSS configuration
vmss_name = "vmss-operaterra-ecom"
vmss_admin_password = "5ecur3pwd!"
vmss_admin_username = "adm!n!5tr4t0r"
vmss_sku = "Standard_B2ms"
vmss_nic = "ot-ecom-nic"
vmss_nic_ip_config = "vmss-interal-ip-config"
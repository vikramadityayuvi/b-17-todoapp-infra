module "resource_group" {
    source = "../modules/azurerm_resource_group"
    resource_group_name = "rg-todoapp6519"
    resource_group_location = "centralindia"
  
}

module "virtual_network" {
    depends_on = [ module.resource_group ]
    source = "../modules/azurerm_virtual_network"
    resource_group_name = "rg-todoapp6519"
    virtual_network_name = "vnet-todoapp6519"
    virtual_network_location = "centralindia"
    address_space = ["10.0.0.0/16"]
  
}


module "frontend_subnet" {
    depends_on = [ module.virtual_network ]
    source = "../modules/azurerm_subnet"
    subnet_name = "frontend-subnet6519"
    resource_group_name = "rg-todoapp6519"
    virtual_network_name = "vnet-todoapp6519"
    address_prefixes = ["10.0.1.0/24"]
  
}


# module "backend_subnet" {
#     depends_on = [ module.virtual_network ]
#     source = "../modules/azurerm_subnet"
#     subnet_name = "backend-subnet6519"
#     resource_group_name = "rg-todoapp6519"
#     virtual_network_name = "vnet-todoapp6519"
#     address_prefixes = ["10.0.2.0/24"]
  
# }

module "public_ip_frontend" {
    depends_on = [ module.resource_group ]
    source = "../modules/azurerm_public_ip"

    public_ip_name = "pip-frontendtodoapp6519"
    resource_group_name = "rg-todoapp6519"
    public_ip_location = "centralindia  "
    allocation_method = "Static"
  
}



# module "public_ip_backend" {
#     depends_on = [ module.resource_group ]
#     source = "../modules/azurerm_public_ip"

#     public_ip_name = "pip-backendtodoapp6519"
#     resource_group_name = "rg-todoapp6519"
#     public_ip_location = "centralindia"
#     allocation_method = "Static"
  
# }


module "frontend_vm6519" {
    depends_on = [ module.frontend_subnet,module.key_vault,module.vm_username ,module.vm_password,module.public_ip_frontend]
    source = "../modules/azurerm_virtual_machine"
   
   
    resource_group_name = "rg-todoapp6519"
    location = "centralindia"
    vm_name = "todo-frontendvm6519"
    vm_size = "Standard_B1s"
    admin_username = "devopsadmin"
    admin_password = "password@1234"
    image_publisher = "Canonical"
    image_offer = "0001-com-ubuntu-server-focal"
    image_sku = "20_04-lts"
    image_version = "latest"
    nic_name = "nic-vm-frontend6519"
    virtual_network_name = "vnet-todoapp6519"
    subnet_name = "frontend-subnet6519"
    pip_name = "pip-frontendtodoapp6519"
    key_vault_name = "sonamkibuchi-todoapp"
    username_secret_name = "vm-username"
    password_secret_name = "vm-password"
    
  }

# module "backend_vm6519" {
#     depends_on = [ module.backend_subnet]
#     source = "../modules/azurerm_virtual_machine"
   
   
#     resource_group_name = "rg-todoapp6519"
#     location = "centralindia"
#     vm_name = "todo-backendvm6519"
#     vm_size = "Standard_B1s"
#     admin_username = "devopsadmin"
#     admin_password = "vikramaditya@0010"
#     image_publisher = "Canonical"
#     image_offer = "0001-com-ubuntu-server-focal"
#     image_sku = "20_04-lts"
#     image_version = "latest"
#     nic_name = "nic-vm-backend6519"
#     virtual_network_name = "vnet-todoapp6519"
#     subnet_name = "backend-subnet6519"
#     pip_name = "pip-backendtodoapp6519"
    
    
#   }

# module "sql_server" {
#     depends_on = [ module.resource_group ]
    
#     source = "../modules/azurerm_sql_server"
    
#     sql_server_name = "sqlserver-todoapp6519"
#     resource_group_name = "rg-todoapp6519"
#     location = "centralindia"
#     administrator_login = "sqladmin"
#     administrator_login_password = "vikramaditya@0010"
  
# }


# module "sql_database" {
#     depends_on = [ module.sql_server ]
#     source = "../modules/azurerm_sql_database"
    
#     sql_database_name = "sqldb-todoapp6519"
#     sql_server_id = "/subscriptions/b8bfe010-cd92-4a56-a797-e30f0d592bc2/resourceGroups/rg-todoapp6519/providers/Microsoft.Sql/servers/sqlserver-todoapp6519"
  
# }

module "key_vault" {
    depends_on = [ module.resource_group ]
    source = "../modules/azurerm_key_vault"
    
    key_vault_name = "sonamkibuchi-todoapp"
    resource_group_name = "rg-todoapp6519"
    location = "centralindia"
    
  
}

module "vm_username" {
    depends_on = [ module.key_vault ]
    source = "../modules/azurerm_key_vault_secret"
    
    key_vault_name = "sonamkibuchi-todoapp"
    resource_group_name = "rg-todoapp6519"  
    secret_name = "vm-username"
    secret_value = "devopsadmin"
    
  
}

module "vm_password" {
    depends_on = [ module.key_vault ]
    source = "../modules/azurerm_key_vault_secret"
    
    key_vault_name = "sonamkibuchi-todoapp"
    resource_group_name = "rg-todoapp6519"  
    secret_name = "vm-password"
    secret_value = "password@1234"
    
  
}


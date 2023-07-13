## Azure Virtual Network Usage

```hcl

module "rg" {
  source  = "../../../cfn-tf-az-rg"
  location    = "eastus"
  rg_name     = "cfn-rg-demo-01"
  lock_level  = ""
  tags        = {
      "Environment" = "Terraform Demo"
	  "Owner Email" = "cgajjeli@commonwealth.com"
	  "Application Name" = "cfndemo"
  }  
}

module "vnet" {
  source  =  "../../../cfn-tf-az-vnet"
  location       = module.rg.resource_group_location
  vnet_name      = "cfn-vnet-demo-01"  
  resource_group_name = module.rg.resource_group_name
  vnet_cidr   = ["10.10.0.0/16"]
  dns_servers = ["10.0.0.4", "10.0.0.5"] # Can be empty if not used
  tags        = {
      "Environment" = "Terraform Demo"
	  "Owner Email" = "cgajjeli@commonwealth.com"
	  "Application Name" = "cfndemo"
  }  
}

```

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network.main_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurecaf_name.vnet](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/data-sources/name) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| vnet\_name | Optional custom virtual network name | `string` | `""` | yes |
| dns\_servers | List of IP addresses of DNS servers | `list(string)` | `[]` | no |
| tags | Extra tags to add | `map(string)` | `{}` | no |
| location | Azure region to use | `string` | n/a | yes |
| resource\_group\_name | Resource group name | `string` | n/a | yes |
| vnet\_cidr | The address space that is used by the virtual network | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| virtual\_network\_id | Virtual network generated id |
| virtual\_network\_location | Virtual network location |
| virtual\_network\_name | Virtual network name |
| virtual\_network\_space | Virtual network space |
<!-- END_TF_DOCS -->
## Related documentation

Microsoft Azure documentation: [docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview)


resource "azurerm_dns_zone" "dnsaks" {
  name                = var.domain_name 
  resource_group_name = azurerm_resource_group.rg.name
}


resource "azurerm_dns_a_record" "vote" {
  name                = "vote"
  zone_name           = azurerm_dns_zone.dnsaks.name
  resource_group_name = azurerm_resource_group.rg.name
  ttl                 = 300
  records             = [var.ip_node01]
}



package rules

deny[msg] {
	resource := input.resource.azurerm_kubernetes_cluster.vuln_k8_cluster.default_node_pool
	not resource.vm_size == "Standard_D2_v4"
	msg := {
		"publicId": "AZURE_CUSTOM_1",
		"title": "Incorrect VM Size for Nodes",
		"severity": "medium",
		"issue": "Incorrect VM Size for Nodes",
		"impact": "There could be performance Impacts",
		"msg": sprintf("%s nodepool vmsize is not optimal for performance", [resource.name]),
		"remediation": "We require all AKS cllusters to use ",
		"references": [],
	}
}
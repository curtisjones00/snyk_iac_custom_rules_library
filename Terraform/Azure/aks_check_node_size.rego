deny[msg] {
	resource := input.resource.azurerm_kubernetes_cluster.<ENTER_AKS_CLUST_NAME>.<ENTER_NODE_POOL_NAME>
	not resource.vm_size == "<ENTER_VM_SIZE>"
	msg := {
		"publicId": "VM_SIZE_FOR_K8",
		"title": "Incorrect VM Size for Nodes",
		"severity": "medium",
		"issue": "Incorrect VM Size for Nodes",
		"impact": "There could be performance Impacts",
		"remediation": "",
		"msg": sprintf("%s nodepool vmsize is not optimal for performance", [resource.name]),
		"references": [],
	}
}

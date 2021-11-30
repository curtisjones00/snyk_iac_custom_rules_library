package rules

deny[msg] {
    input.kind == "Deployment" 
    requested_images = {img | img := input.spec.template.spec.containers[_].image}
    not has_string(":",requested_images)
		msg := {
		"publicId": "KUBERNETES_CUSTOM_1",
		"title": "Container image does not have a tag",
		"severity": "critical",
		"issue": "Container image does not have a tags",
		"impact": "Incorrect image version could be deployed",
		"remediation": "Apply tag",
		"msg": sprintf("%s does not have tag", [input.spec.template.spec.containers[_].image]),
		"remediation": "Add a specific image tag. Do not use 'latest'",
		"references": [],
	}
}

has_string(str,arr){
	contains(arr[_],str)
}
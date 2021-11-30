package rules


deny[msg] {
    input.kind == "Deployment" 
    requested_images = {img | img := input.spec.template.spec.containers[_].image}
    has_string(":latest",requested_images)
		msg := {
		"publicId": "KUBERNETES_CUSTOM_2",
		"title": "Container image is using latest tag",
		"severity": "critical",
		"issue": "Container image is using latest tag",
		"impact": "Incorrect image version could be deployed",
		"msg": sprintf("%s is using 'latest' tag", [input.spec.template.spec.containers[_].image]),
		"remediation": "Add a specific tag to the image. Do not use 'latest'",
		"references": [],
	}
}
has_string(str,arr){
	contains(arr[_],str)
}
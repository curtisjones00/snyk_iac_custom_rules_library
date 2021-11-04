deny[msg] {
    input.kind == "Deployment" 
    requested_images = {img | img := input.spec.template.spec.containers[_].image}
    not has_string(":",requested_images)
    	msg := {
		"id": "124",
		"publicId": "CUSTOM-124",
		"title": "Container image does not have a tag",
		"type": "custom",
		"subType": "Kubernetes",
		"severity": "critical",
		"policyEngineType": "opa",
		"issue": "A container is using the 'latest' tag. This is against our policies" ,
		"impact": "Deployment will be blocked until this is resolved.",
		"resolve": "Set a specifc tag on `input.spec.template.spec.containers[_].image`",
		"msg": "input.spec.template.spec.containers[_].image",
		"references": [],
	}
}

has_string(str,arr){
	contains(arr[_],str)
}


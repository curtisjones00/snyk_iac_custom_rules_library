deny[msg] {
    input.kind == "Deployment" 
    requested_images = {img | img := input.spec.template.spec.containers[_].image}
    has_string(":latest",requested_images)
    	msg := {
		"id": "123",
		"publicId": "CUSTOM-123",
		"title": "Container is using the 'latest' tag",
		"type": "custom",
		"subType": "Kubernetes",
		"severity": "critical",
		"policyEngineType": "opa",
		"issue": "A container is using the 'latest' tag. This is against our policies" ,
		"impact": "Deployment will be blocked until this is resolved.",
		"resolve": "Set a specifc tag on `input.request.object.spec.containers[_].image`",
		"msg": "input.spec.spec.containers[_].image",
		"references": [],
	}
}
has_string(str,arr){
	contains(arr[_],str)
}

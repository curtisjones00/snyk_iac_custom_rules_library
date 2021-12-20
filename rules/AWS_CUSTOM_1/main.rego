package rules

deny[msg] {
	port := 22
	sg := input.resource.aws_security_group[name]
	sg.ingress[_].to_port == port
	sg.ingress[_].cidr_blocks == ["0.0.0.0/0"]
	msg := {
		# Mandatory fields
		"publicId": "AWS_CUSTOM_1",
		"title": sprintf("Security Group allows for access to port %d", [port]),
		"severity": "critical",
		# Optional fields
		"issue": sprintf("Security Group allows for access to port %d", [port]),
		"impact": "Deployment will be blocked until this is resolved.",
		"remediation": "Configure security rule",
		"msg": sprintf("%s has port 22 open to the internet", [sg.name]),
		"references": [],
	}
}
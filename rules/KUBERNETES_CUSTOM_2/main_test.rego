package rules

import data.lib
import data.lib.testing

test_KUBERNETES_CUSTOM_2 {
	# array containing test cases where the rule is allowed
	allowed_test_cases := [{
		"want_msgs": [],
		"fixture": "allowed.yaml",
	}]

	# array containing cases where the rule is denied
	denied_test_cases := [{
		"want_msgs": ["michaelbraunbass/goof:latest is using 'latest' tag"], # verifies that the correct msg is returned by the denied rule
		"fixture": "denied.yaml",
	}]

	test_cases := array.concat(allowed_test_cases, denied_test_cases)
	testing.evaluate_test_cases("KUBERNETES_CUSTOM_2", "./rules/KUBERNETES_CUSTOM_2/fixtures", test_cases)
}

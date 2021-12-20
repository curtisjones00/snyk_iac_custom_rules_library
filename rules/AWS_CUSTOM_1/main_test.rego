package rules

import data.lib
import data.lib.testing

test_AWS_CUSTOM_1 {
	# array containing test cases where the rule is allowed
	allowed_test_cases := [{
		"want_msgs": [],
		"fixture": "allowed.json",
	}]

	# array containing cases where the rule is denied
	denied_test_cases := [{
		"want_msgs": ["allow_ssh has port 22 open to the internet"], # verifies that the correct msg is returned by the denied rule
		"fixture": "denied.json",
	}]

	test_cases := array.concat(allowed_test_cases, denied_test_cases)
	testing.evaluate_test_cases("AWS_CUSTOM_1", "./rules/AWS_CUSTOM_1/fixtures", test_cases)
}

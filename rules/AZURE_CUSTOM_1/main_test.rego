package rules

import data.lib
import data.lib.testing

test_AZURE_CUSTOM_1 {
	# array containing test cases where the rule is allowed
	allowed_test_cases := [{
		"want_msgs": [],
		"fixture": "allowed.tf",
	}]

	# array containing cases where the rule is denied
	denied_test_cases := [{
		"want_msgs": ["default nodepool vmsize is not optimal for performance"], # verifies that the correct msg is returned by the denied rule
		"fixture": "denied.tf",
	}]

	test_cases := array.concat(allowed_test_cases, denied_test_cases)
	testing.evaluate_test_cases("AZURE_CUSTOM_1", "./rules/AZURE_CUSTOM_1/fixtures", test_cases)
}

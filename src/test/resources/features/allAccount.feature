@Regression
Feature: Retrieving account

Background:
* def result = callonce read('practiceGenerateToken.feature')
Then print result
* def generatedToken = result.response.token
Given url "https://tek-insurance-api.azurewebsites.net"

Scenario: Get all accounts

And path "/api/accounts/get-all-accounts"
And header Authorization = "Bearer " + generatedToken
When method get
And status 200



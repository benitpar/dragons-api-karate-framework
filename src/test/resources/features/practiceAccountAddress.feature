@Regression
Feature: Address

Background: 

* def result = callonce read('practiceGenerateToken.feature')
Then print result
* def generatedToken = result.response.token
Given url "https://tek-insurance-api.azurewebsites.net"

 Scenario: Add Address to User
 
 And path "/api/accounts/add-account-address"
 And param primaryPersonId = 8574
 And header Authorization = "Bearer " + generatedToken
 And request
 """
 {
  "addressType": "Home",
  "addressLine1": "1234 suess rd",
  "city": "Fairfax",
  "state": "Virginia",
  "postalCode": "22306",
  "countryCode": "01",
  "current": true
}
 """
 When method post
 And status 201
 Then print response
 


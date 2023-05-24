
@Regression
Feature: Phone Number

Background:

* def result = callonce read('practiceGenerateToken.feature')
Then print result
* def generatedToken = result.response.token
Given url "https://tek-insurance-api.azurewebsites.net"

Scenario: Title of your scenario

* def generatePhone = Java.type('api.data.GenerateData')
* def autoPhone = generatePhone.getPhoneNumber()
And path "/api/accounts/add-account-phone"
And header Authorization = "Bearer " + generatedToken
And param primaryPersonId = 8574
And request
"""
{
  "phoneNumber": "#(autoPhone)",
  "phoneExtension": "01",
  "phoneTime": "Day",
  "phoneType": "Cell"
}
"""
When method post
And status 201
Then print response








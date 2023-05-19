

Feature: Phone Number

Background:

* def result = callonce read('practiceGenerateToken.feature')
Then print result
* def generatedToken = result.response.token
Given url "https://tek-insurance-api.azurewebsites.net"

Scenario: Title of your scenario

* def generateData = Java.type('api.data.GenerateData')
* def autoPhone = generateData.getPhoneNumber()
And path "api/accounts/add-account-phone"
And param primaryPersonId = 7846
And header Authorization = "Bearer " + generatedToken
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







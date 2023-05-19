
Feature: End Account Testing 


Background: Set up URL

* def result = callonce read('practiceGenerateToken.feature')
Then print result
* def generatedToken = result.response.token
Given url "https://tek-insurance-api.azurewebsites.net"

 Scenario: Create account
 
 * def dataGenerator = Java.type('api.data.GenerateData')
 * def autoEmail = dataGenerator.getEmail()
 And path "/api/accounts/add-primary-account"
 And header Authorization = "Bearer " + generatedToken
 And request
 """
 {
  "email": "#(autoEmail)",
  "firstName": "Parlo",
  "lastName": "Dheming",
  "title": "Mr",
  "gender": "MALE",
  "maritalStatus": "MARRIED",
  "employmentStatus": "SDET",
  "dateOfBirth": "1992-05-19T07:19:53.162Z",
}
 """
 When method post
 And status 201
 Then print response
 

 
 
 
 
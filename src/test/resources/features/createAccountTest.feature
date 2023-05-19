
Feature: Create Account Test

Background: API Test Setup

* def result = callonce read('generateToken.feature')
And print result
* def generatedToken = result.response.token
Given url "https://tek-insurance-api.azurewebsites.net"

Scenario: Create Account with random email 
* def dataGenerator = Java.type('api.data.GenerateData')
* def autoEmail = dataGenerator.getEmail()
 And path "/api/accounts/add-primary-account"
 And header Authorization = "Bearer " + generatedToken
 And request 
 """
 {
  "email": "#(autoEmail)",
  "firstName": "Jeff",
  "lastName": "Kessie",
  "title": "Mr.",
  "gender": "MALE",
  "maritalStatus": "MARRIED",
  "employmentStatus": "Cyber",
  "dateOfBirth": "1998-04-04",
}
 """
 When method post
 Then status 201
 Then print result
 And assert response.email==autoEmail


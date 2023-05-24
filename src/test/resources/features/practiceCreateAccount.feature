@Regression
Feature: End Account Testing 


Background: Set up URL
* def result = callonce read('practiceGenerateToken.feature')
Then print result
* def generatedToken = result.response.token
Given url "https://tek-insurance-api.azurewebsites.net"

 Scenario: Create account
 
 * def generatedEmail = Java.type('api.data.GenerateData')
 * def autoEmail = generatedEmail.getEmail()
 And path "/api/accounts/add-primary-account"
 And header Authorization = "Bearer " + generatedToken
 And request
 """
 {
  "email": "#(autoEmail)",
  "firstName": "Alan",
  "lastName": "Zelaya",
  "title": "Mrs.",
  "gender": "MALE",
  "maritalStatus": "MARRIED",
  "employmentStatus": "sdet",
  "dateOfBirth": "1996-05-24T05:26:19.367Z",
}
 """
 When method post
 And status 201
 Then print response
 

 

 
 
 
 
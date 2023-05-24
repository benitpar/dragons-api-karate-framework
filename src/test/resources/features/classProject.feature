

Feature: Account


Background: 

* def result = callonce read('practiceGenerateToken.feature')
Then print result 
* def generatedToken = result.response.token
Given url "https://tek-insurance-api.azurewebsites.net"

Scenario: 

And path "/api/accounts/all-accounts"
And header Authorization = "Bearer " + generatedToken
And request
"""
[
  {
    "id": 0,
    "email": "string",
    "title": "string",
    "firstName": "string",
    "lastName": "string",
    "gender": "MALE",
    "maritalStatus": "MARRIED",
    "employmentStatus": "string",
    "dateOfBirth": "2023-05-24T17:30:30.464Z",
    "user": {
      "id": 0,
      "fullName": "string",
      "username": "string",
      "accountType": "CSR",
      "authorities": [
        {
          "id": 0,
          "role": "string",
          "users": [
            "string"
          ]
        }
      ],
      "accountNonExpired": true,
      "accountNonLocked": true,
      "credentialsNonExpired": true,
"""
When method get
And status 200
Then print response



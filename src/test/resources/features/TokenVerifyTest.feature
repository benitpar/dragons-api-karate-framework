

Feature: Token Verify Test 

Background: Setup Test URL
Given url "https://tek-insurance-api.azurewebsites.net"

 Scenario: Verify Valid Token
 
 And path "/api/token"
 And request {"username": "supervisor","password": "tek_supervisor"}
 When method post
 Then status 200
 And print response
 Given path "/api/token/verify"
 And param token = response.token
 And param username = "supervisor"
 When method get
 Then status 200
 And print response
 And response=="true"
 
  Scenario: Negative test : Verify Valid Token with invalid user name
 
 And path "/api/token"
 And request {"username": "supervisor","password": "tek_supervisor"}
 When method post
 Then status 200
 And print response
 Given path "/api/token/verify"
 And param token = response.token
 And param username = "supervisorr"
 When method get
 Then status 400
 And print response
 And response=="false"
 And assert response.errorMessage=="Wrong Username send along with Token"
 
 Scenario: Negative test: verify Token with invalid token and valid username
 

 Given path "/api/token/verify"
 And param token = "invalid_token"
 And param username = "supervisor"
 When method get
 Then status 400
 And print response
 And response=="false"
 And assert response.errorMessage=="Token Expired or Invalid Token"
 
 
 
 
  
 
  




Feature: API Test Security Selection


Background: 

 Given url "https://tek-insurance-api.azurewebsites.net"
 And path "/api/token"

  Scenario: Create token with valid username and password.
  #prepare request
  And request {"username": "supervisor","password": "tek_supervisor"}
  #Send request
  When method post
  #Validating response
  Then status 200
  And print response


  Scenario: Sending incorrect username and correct password
  
  #prepare request
  And request {"username": "supervisorr","password": "tek_supervisor"}
  #Send request
  When method post
  #Validating response
  Then status 400
  And print response
  #Assertion with entity of what we are validating
  And assert response.errorMessage=="User not found"


  Scenario: Sending valid username and incorrect password
  
  #prepare request
  And request {"username": "supervisor","password": "tek_supervisorr"}
  #Send request
  When method post
  #Validating response
  Then status 400
  And print response
  #Assertion with entity of what we are validating
  And assert response.errorMessage=="Password Not Matched"
  And assert response.httpStatus=="BAD_REQUEST"

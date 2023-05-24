@Regression
Feature: Car

Background: 
* def result = callonce read('practiceGenerateToken.feature')
Then print result
* def generatedToken = result.response.token
Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Create Car
  
  * def generatedLicensePlate = Java.type('api.data.GenerateData')
  * def autoPlate = generatedLicensePlate.getLicensePlate()
  And path "/api/accounts/add-account-car"
  And header Authorization = "Bearer " + generatedToken
  And param primaryPersonId = 8574
  And request
  """
  {
  "make": "Toyota",
  "model": "Hylander",
  "year": "2006",
  "licensePlate": "#(autoPlate)"
}
  """
  When method post
  And status 201
  Then print response
  






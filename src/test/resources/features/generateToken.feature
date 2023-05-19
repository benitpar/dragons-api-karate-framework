

Feature: Generate a valid token

Scenario: Generate token

Given url "https://tek-insurance-api.azurewebsites.net"
 And path "/api/token"
 And request {"username": "supervisor","password": "tek_supervisor"}
 When method post
 And status 200
 Then print response
 * def generatedToken = response.token


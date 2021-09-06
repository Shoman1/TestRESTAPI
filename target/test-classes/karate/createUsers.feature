Feature: check create users by GET API

Background:
* url 'https://gorest.co.in'
* header Content-Type = 'application/json'
* header Authorization = 'Bearer 22a016c60a705f8ef30f47a582716340abfd07c342aedfadad575914ee3d9f80'
 
 @first
Scenario Outline: Create a user with all valid user details
Given path '/public/v1/users'
And request {"name": "<name>", "email": "<email>", "gender": "<gender>", "status": "<status>"}
When method POST
Then status 201

And def userResponse = response
Then match userResponse.data.name contains "John Petter"

Examples:
|name										|email												|gender	|status	|
|John Petter						|johnpetter25@example.com			|male		|active	|	
			



Scenario Outline: Create a user with blank name
Given path '/public/v1/users'
And request {"name": "<name>", "email": "<email>", "gender": "<gender>", "status": "<status>"}
When method POST
Then status 422

Examples:
|name			|email							 			|gender	|status	|
| 				|testsmith25@example.com	|male		|active	|	
	
	
Scenario Outline: Create a user with incorrect gender type
Given path '/public/v1/users'
And request {"name": "<name>", "email": "<email>", "gender": "<gender>", "status": "<status>"}
When method POST
Then status 422

Examples:
|name				|email							 			|gender	|status	|
|Rick Mark	|testsmith35@example.com	|test		|active	|		


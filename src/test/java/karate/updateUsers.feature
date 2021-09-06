Feature: check create users by GET API

Background:
* url 'https://gorest.co.in'
* header Content-Type = 'application/json'
* header Authorization = 'Bearer 22a016c60a705f8ef30f47a582716340abfd07c342aedfadad575914ee3d9f80'
 
 @first
Scenario Outline: Update user with all valid user details whose id is <id>
Given path '/public/v1/users/<id>'
And request {"name": "<name>", "email": "<email>", "gender": "<gender>", "status": "<status>"}
When method PUT
Then status 200

And def userResponse = response
Then match userResponse.data.name contains "Arindam Varman"

Examples:
|id|name										|email													|gender	|status	|
|30|Arindam Varman					|varman_arindam@hilll.info			|male		|active	|	
			
Scenario Outline: Update a user with duplicate email address
Given path '/public/v1/users/<id>'
And request {"name": "<name>", "email": "<email>", "gender": "<gender>", "status": "<status>"}
When method PUT
Then status 404

Examples:
|id|name										|email													|gender	|status	|
|1|Arindam Kumar Varman			|varman_arindam@hilll.info			|male		|active	|	


Scenario Outline: Update a user with blank email
Given path '/public/v1/users/<id>'
And request {"name": "<name>", "email": "<email>", "gender": "<gender>", "status": "<status>"}
When method PUT
Then status 422

Examples:
|id	|name			 	|email			|gender	|status	|
|30	|test Smith	|						|male		|active	|	
	
	

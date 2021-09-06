Feature: Delete the given users by DELETE API

Background:
* url 'https://gorest.co.in'
* header Content-Type = 'application/json'
* header Authorization = 'Bearer 22a016c60a705f8ef30f47a582716340abfd07c342aedfadad575914ee3d9f80'
 
@first			
Scenario Outline: Delete the given user whose id is 
Given path '/public/v1/users/<id>'
When method DELETE
Then status 204

Examples:
|id|
|35|

@second	
Scenario Outline: Delete the given user whose id is 
Given path '/public/v1/users/<id>'
When method DELETE
Then status 404

Examples:
|id|
|35|
	
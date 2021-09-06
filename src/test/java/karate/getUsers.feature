Feature: Fetching User Details by GET API

Background:
* url 'https://gorest.co.in'
* header Accept = 'application/json'
 
 @first
Scenario Outline: list the user details having id as <id>
 
Given path '/public/v1/users/<id>'
When method GET
Then status 200

	Examples:
	|id|
	|31|
  |32|


@second
Scenario: get list all user details by not passing any user id
 
Given path '/public/v1/users'
When method GET
Then status 200


@third
Scenario Outline: list the user details having invalid user <id>
 
Given path '/public/v1/users/<id>'
When method GET
Then status 404

	Examples:
	|id|
	|0|


@fourth
Scenario Outline: get the user details by passing valid name <name>
Given path '</public/v1/users>'
Then param name = '<name>'
When method GET
Then status 200

And def userResponse = response
Then match userResponse.data[*].name contains ["<name>"]

Examples:
	|path|name										|
	|/public/v1/users|Prof. Bandhu Varrier		|
  |/public/v1/users|Jyotsana Bharadwaj Esq.|
 
	
				




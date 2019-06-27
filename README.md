# README

Application name - Administrative_portal

ruby '2.6.1'
rails '5.2.3'

LOGIN DETAILS OF API AND ITS METHODS
POST sessions
URL: http://localhost:3000/api/v1/sessions

request json: 
	{
		"email" : "avinash@yopmail.com",
		"password" : "123456"
	}

response json: 
	{
	    "status": "SUCCESS",
	    "message": "Logged in!",
	    "data": ""
	}


DELETE sessions

URL: http://localhost:3000/api/v1/sessions/:id

 USER DETAILS OF API AND ITS METHODS

GET users

URL: http://localhost:3000/api/v1/users

PUT http://localhost:3000/api/v1/users/:id

POST http://localhost:3000/api/v1/remove_tag

request json: 
{

          "tag_id" : 1,
          "user_id" : 8
	
}

POST http://localhost:3000/api/v1/sort

{
	"sort" : "city"
}

POST http://localhost:3000/api/v1/filter

{
	"mobile" : "9876543212"
}

PUT http://localhost:3000/api/v1/users/user_status/2

{
	"ability" : true
}
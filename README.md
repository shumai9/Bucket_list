# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
#Error that needs fixing
 Users API Post /v1/users When the request is invalid returns a validation failure message
     Failure/Error: params.require(:user).permit(:user_name, :first_name, :last_name, :email, :password)
     
     ActionController::ParameterMissing:
       param is missing or the value is empty: user

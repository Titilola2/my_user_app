# Welcome to My Users App
My User App project was developed using Ruby language, Sinatra framework was used to achieve 
the famous architecture: MVC (Model View Controller).

## Task
This project consists of 3 parts presented in roman figures

PART I
Create a class User, it will be your interface in order to:
create user,
find user,
get all users,
update user,
destroy user in sqlite.

class will have the following methods:

def create(user_info)
def find(user_id)
def all
def update(user_id, attribute, value)
def destroy(user_id)

PART II 
Create a controller and use the User class from Part I. The route will return a JSON.

It will have multiple routes:

GET on /users. This action will return all users (without their passwords).

POST on /users. Receiving firstname, lastname, age, password and email. It will create a user and store in your database and returns the user created (without password).

POST on /sign_in. Receiving email and password. It will add a session containing the user_id in order to be logged in and returns the user created (without password).

PUT on /users. This action require a user to be logged in. It will receive a new password and will update it. It returns the user created (without password).

DELETE on /sign_out. This action require a user to be logged in. It will sign_out the current user. It returns nothing (code 204 in HTTP).

DELETE on /users. This action require a user to be logged in. It will sign_out the current user and it will destroy the current user. It returns nothing (code 204 in HTTP).

## Description
The descriptions are explained in 3 parts below


PART I 
class will have the following methods:

def create(user_info) create a user. User info are: firstname, lastname, age, password and email
And it returned a unique user ID (a positive integer)

def find(user_id)
It retrieved the associated user and return all information contained in the database.

def all
It retrieved all users and return a hash of users.

def update(user_id, attribute, value)
It retrieved the associated user, update the attribute send as parameter with the value and return the user hash.

def destroy(user_id)
It retrieved the associated user and destroy it from the database.

PART II
All routes listed in the task section were deployed in the controller

PART III
Require testing to view the interface. Follow the steps below
step 1: Run command: ruby app.rb
step 2: visit the link https://web-iccd72a3a-f0f5.docode.fi.qwasar.io/

## Installation
This project require no installation

## Usage
To use this project you can adopt the model and controller code inmy_user_model.rb 
and app.rb files respectively.

### The Core Team
OGTL Traineee
Sani Muhammad

<span><i>Made at <a href='https://qwasar.io'>Qwasar SV -- Software Engineering School</a></i></span>
<span><img alt='Qwasar SV -- Software Engineering School's Logo' src='https://storage.googleapis.com/qwasar-public/qwasar-logo_50x50.png' width='20px'></span>

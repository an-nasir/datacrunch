# README
# Steps to setup and run this project 

This project extract data from a given URL and content of (h1,2,3) in database.

* Clone it with git in a directory of your choice and 'cd' to that directory
* You need to install latest ruby with RVM 'rvm install 2.3.3' (Ruby version 2.3.3)
* After installing switch to new ruby by 'rvm use 2.3.3'
* Create new gemset in this ruby (rvm gemset create nameOfGemset) and then rvm gemset use nameOfGemset
* Run DB migrations in console 'rake db:migrate'
* After that run rails server 'rails s'
* -- If you run your server on different port then you have to change port in swagger base path in 'config/initilizer/swagger.rb' file 'base_path: 'http://localhost:3000'
* After that go to 'http://localhost:3000/api'
* Here you can see all endpoints Under # Crunches

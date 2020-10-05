# README
# patient_registry
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 2.6.3

* System dependencies: 
sunspot solr gem is used 
so before starting rails server run below command
`bundle exec rake sunspot:solr:start`

* To create bulk data run
`rake data:populate`
This command will create 200 patient records

* After creation of data run
`bundle exec rake sunspot:solr:start` an start rails server

* need to add client_id and client_secret for google auth it was tested using my google auth key if need to test usinh my cred mail me on amitg.wagh@gmail.com

* written sample test cases for patient model can write all if need for thsi assignment.
 
 * UI is basic if you need I can change as per requirements.
 
 * Lot of things can improve but for this project is for assignment purposes so limit the scope.
 
 



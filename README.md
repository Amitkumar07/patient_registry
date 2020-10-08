# README
# patient_registry
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 2.6.3

* Rails version: >= 6.0.3.2

* System dependencies: 
sunspot solr gem is used 
so before starting rails server run below command
`bundle exec rake sunspot:solr:start`

* To create bulk data run
`rake data:populate`
This command will create 200 patient records

* After creation of data run
`bundle exec rake sunspot:solr:start` an start rails server

* need to add client_id and client_secret for google auth.


 
 
 
 
 
 



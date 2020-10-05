namespace :data do
  task :populate => [ :environment ] do
    require 'faker'
     200.times.each do |n|
       first_name = Faker::Name.unique.first_name
       last_name = Faker::Name.unique.last_name
       Patient.create(first_name: first_name,
                      last_name: last_name,
                      email: (first_name+"."+last_name+"@amit.com"),
                      mobile_number: Faker::PhoneNumber.cell_phone_in_e164,
                      dob: Faker::Date.birthday(min_age: 18, max_age: 65).to_date,
                      is_insured: Faker::Boolean.boolean,
                      mrn: Faker::Number.number(digits: 10),
                      zip: Faker::Number.number(digits: 5))
       print'.'
     end
  end

end

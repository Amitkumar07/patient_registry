FactoryBot.define do

  factory :patient do
    first_name { 'John' }
    last_name  { 'Doe' }
    dob  { 21.years.ago }
    email { 'john.doe@exapmple.com' }
    mrn { '124341123' }
  end


end

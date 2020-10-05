class Patient < ApplicationRecord


  validates_presence_of :first_name, :last_name, :email, :mrn
  validates_format_of :email,:with => Devise::email_regexp

  searchable do
    text :full_name
    text :mrn
    string :full_name
    boolean :is_insured
  end


  def full_name
    "#{first_name} #{last_name}"
  end

end

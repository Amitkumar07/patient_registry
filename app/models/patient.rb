class Patient < ApplicationRecord


  validates_presence_of :first_name, :last_name, :email, :mrn
  validates_format_of :email,:with => Devise::email_regexp


  def full_name
    "#{first_name} #{last_name}"
  end

end

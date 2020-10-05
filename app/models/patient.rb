class Patient < ApplicationRecord


  validates_presence_of :first_name, :last_name, :email, :mrn
  validates_format_of :email,:with => Devise::email_regexp

  has_many_attached :documents

  searchable do
    text :full_name
    text :mrn
    string :full_name
    string :is_insured do
      is_insured ? 'yes' : 'no'
    end
  end


  def full_name
    "#{first_name} #{last_name}"
  end

end

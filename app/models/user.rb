class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable,:omniauthable, :omniauth_providers => [:google_oauth2]

  validates_confirmation_of :password, :if => :password_required?

  def self.from_google(email:, full_name:, uid:, provider:)
    where(provider: provider, uid: uid).first_or_create do |user|
       user.provider = provider
       user.uid = uid
       user.email = email
       user.full_name = full_name
    end
  end



  def password_required?
    super && provider.blank?
  end
end
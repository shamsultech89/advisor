class User < ActiveRecord::Base
  attr_accessible :account_type_id, :email, :first_name, :last_name, :password,:password_confirmation
  
  has_secure_password
  
  belongs_to :account_type
end

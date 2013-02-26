class AccountType < ActiveRecord::Base
  attr_accessible :name, :status
  
  has_many :users
  
  ADMIN = 1
  USER = 2
  
end

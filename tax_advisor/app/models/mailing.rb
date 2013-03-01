class Mailing < ActiveRecord::Base
  attr_accessible :body, :email, :from, :photo, :subject
end

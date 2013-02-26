class User < ActiveRecord::Base
  attr_accessible :account_type_id, :email, :first_name, :last_name, :password,:password_confirmation
  
  has_secure_password
  
  belongs_to :account_type
  
  validates :email, :presence => true, :uniqueness => true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

  validates :password, :presence => true, :on => :create
  validates_size_of :password, :within => 6..15, :on => :create
  before_create { generate_token(:auth_token) }
  
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end


  def generate_token(column)
    begin
      
      #self[column] = SecureRandom.hex
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
  
end

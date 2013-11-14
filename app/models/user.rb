class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :company, :region, :contact, :phone, :address, :interes
  # attr_accessible :title, :body
  has_many :orders
  has_many :questionnaires 
  	scope :interested, where(:interes => true)
    
    def display_name
      self.email # or whatever column you want
    end
end

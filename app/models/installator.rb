class Installator < ActiveRecord::Base
  attr_accessible :installator, :version, :material, :installator, :name
  has_many :materials
  has_attached_file :installator  
end
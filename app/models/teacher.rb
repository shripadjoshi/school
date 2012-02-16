class Teacher < ActiveRecord::Base
  validates :name, :phone, :presence => true
  validates :phone, :uniqueness => true, :numericality => true
  validates :name,:length => { :maximum => 30 }
  validates :phone,:length => { :maximum => 15 }
  
  #This will establish polymorphic relationship with attendance model
  has_many :attendances, :as => :attendable
end

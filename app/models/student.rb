class Student < ActiveRecord::Base
  validates :name, :phone, :classroom_id, :presence => true
  validates :phone, :uniqueness => true, :numericality => true
  validates :name,:length => { :maximum => 30 }
  validates :phone,:length => { :maximum => 15 }
  belongs_to :classroom
  
  #This will establish polymorphic relationship with attendance model
  has_many :attendances, :as => :attendable
  
  scope :actives, lambda{|class_id|{:conditions => ["classroom_id = ? and active = true", class_id]} }
    
end

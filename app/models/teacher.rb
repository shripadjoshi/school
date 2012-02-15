class Teacher < ActiveRecord::Base
  validates :name, :phone, :presence => true
  validates :phone, :uniqueness => true
  has_many :attendances, :as => :attendable
end

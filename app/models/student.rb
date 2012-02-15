class Student < ActiveRecord::Base
  validates :name, :phone, :classroom_id, :presence => true
  validates :phone, :uniqueness => true
  belongs_to :classroom
  has_many :attendances, :as => :attendable
end

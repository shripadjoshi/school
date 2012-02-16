class Schedule < ActiveRecord::Base
  validates :start_date,:end_date, :classroom_id, :teacher_id, :presence => true
  #validates :phone, :uniqueness => true
  belongs_to :teacher
  belongs_to :classroom
end

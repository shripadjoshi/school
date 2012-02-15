class Attendance < ActiveRecord::Base
  belongs_to :attendable, :polymorphic => true
end

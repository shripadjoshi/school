class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :classroom_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end

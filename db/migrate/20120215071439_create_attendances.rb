class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.datetime :time_in
      t.datetime :time_out
      t.references :attendable, :polymorphic => true
      t.timestamps
    end
  end
end

class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :guest, index: true, foreign_key: true
      t.references :attendance_rate, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

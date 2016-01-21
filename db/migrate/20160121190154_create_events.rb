class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :starts_at
      t.integer :duration
      t.references :room, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :event_group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

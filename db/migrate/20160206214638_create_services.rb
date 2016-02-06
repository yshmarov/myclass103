class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.references :service_name, index: true, foreign_key: true
      t.integer :event_quantity
      t.integer :event_length
      t.float :uprice
      t.float :gprice
      t.string :gtype
      t.string :ctype
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end

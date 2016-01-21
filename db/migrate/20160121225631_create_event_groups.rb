class CreateEventGroups < ActiveRecord::Migration
  def change
    create_table :event_groups do |t|
      t.string :name
      t.string :status
      t.integer :service_id
      t.references :attr1, index: true, foreign_key: true
      t.references :attr2, index: true, foreign_key: true
      t.references :attr3, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

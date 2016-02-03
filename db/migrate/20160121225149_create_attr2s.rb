class CreateAttr2s < ActiveRecord::Migration
  def change
    create_table :attr2s do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

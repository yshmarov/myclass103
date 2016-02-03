class CreateAttr1s < ActiveRecord::Migration
  def change
    create_table :attr1s do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

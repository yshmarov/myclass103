class CreateAttr3s < ActiveRecord::Migration
  def change
    create_table :attr3s do |t|
      t.string :attr3

      t.timestamps null: false
    end
  end
end

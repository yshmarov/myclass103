class CreateAttr2s < ActiveRecord::Migration
  def change
    create_table :attr2s do |t|
      t.string :attr2

      t.timestamps null: false
    end
  end
end

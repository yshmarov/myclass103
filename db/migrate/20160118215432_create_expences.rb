class CreateExpences < ActiveRecord::Migration
  def change
    create_table :expences do |t|
      t.float :amount
      t.string :description
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

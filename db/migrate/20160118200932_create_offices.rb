class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

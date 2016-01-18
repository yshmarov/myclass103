class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone
      t.string :website
      t.string :logo

      t.timestamps null: false
    end
  end
end

class AddProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :second_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birthday, :date
    add_column :users, :sex, :string
    add_column :users, :address, :string
    add_column :users, :photo, :string
    add_column :users, :active, :boolean
  end
end

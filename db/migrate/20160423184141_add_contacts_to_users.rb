class AddContactsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :contact_1, :string
    add_column :users, :contact_2, :string
  end
end

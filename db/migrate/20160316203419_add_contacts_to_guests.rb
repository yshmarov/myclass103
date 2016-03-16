class AddContactsToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :contact_1, :string
    add_column :guests, :contact_2, :string
  end
end

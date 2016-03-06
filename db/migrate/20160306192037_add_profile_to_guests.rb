class AddProfileToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :first_name, :string
    add_column :guests, :second_name, :string
    add_column :guests, :last_name, :string
    add_column :guests, :birthday, :date
    add_column :guests, :sex, :string
    add_column :guests, :address, :string
    add_column :guests, :photo, :string
    add_column :guests, :active, :boolean
    add_column :guests, :lead_source_id, :integer
  end
end

class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :first_name
      t.string :second_name
      t.string :last_name
      t.date :birthday
      t.string :sex
      t.string :email
      t.string :photo
      t.string :address
      t.integer :lead_source
    end
  end
end

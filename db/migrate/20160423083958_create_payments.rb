class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :guest, index: true, foreign_key: true
      t.references :enrollment, index: true, foreign_key: true
      t.float :amount
      t.references :office, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateCashCollections < ActiveRecord::Migration
  def change
    create_table :cash_collections do |t|
      t.float :amount
      t.references :office, index: true, foreign_key: true
      t.references :admin, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

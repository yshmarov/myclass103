class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.references :service, index: true, foreign_key: true
      t.references :event_group, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :coupon, index: true, foreign_key: true
      t.references :opp_status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

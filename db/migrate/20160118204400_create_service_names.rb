class CreateServiceNames < ActiveRecord::Migration
  def change
    create_table :service_names do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

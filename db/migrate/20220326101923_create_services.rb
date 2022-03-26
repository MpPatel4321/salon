class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :service_name, null: false
      t.integer :price,       null: false
      t.datetime :taken_time, null: false
      t.references :shop, null: false, foreign_key: true
      t.timestamps
    end
  end
end

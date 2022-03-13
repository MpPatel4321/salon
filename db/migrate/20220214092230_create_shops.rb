class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :shop_name,       null: false
      t.integer :chair,          null: false           
      t.datetime :opening_time,  null: false
      t.datetime :closing_time,  null: false
      t.timestamps
    end
  end
end

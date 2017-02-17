class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :store
      t.string :name
      t.string :model_number
      t.string :status, default: 'Requested', null: false
      t.string :priority, default: 'Low', null: false
      t.string :price_range
      t.string :shipping_time
      t.references :order

      t.timestamps
    end
  end
end

class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :order_number, null: false
      t.string :order_status, null: false, default: 'Requested'
      t.references :user

      t.timestamps
    end
  end
end

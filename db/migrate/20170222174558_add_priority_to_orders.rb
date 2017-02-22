class AddPriorityToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :priority, :string, default: 'Low', null: false
  end
end

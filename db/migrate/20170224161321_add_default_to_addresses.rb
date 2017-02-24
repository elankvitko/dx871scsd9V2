class AddDefaultToAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :default, :boolean
  end
end

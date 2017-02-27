class DropColorsFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :color
  end
end

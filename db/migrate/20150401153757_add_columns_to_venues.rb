class AddColumnsToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :children_friendly, :boolean, default: false
    add_column :venues, :disabled_access, :boolean, default: false
  end
end

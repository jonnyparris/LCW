class AddColumnsToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :children_friendly, :boolean
    add_column :venues, :disabled_access, :boolean
  end
end

class AddPhotosToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :photos, :json
  end
end

class CreateJoinTableVenueVendor < ActiveRecord::Migration
  def change
    create_join_table :venues, :vendors do |t|
      # t.index [:venue_id, :vendor_id]
      # t.index [:vendor_id, :venue_id]
    end
  end
end

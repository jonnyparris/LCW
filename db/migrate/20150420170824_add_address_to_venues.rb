class AddAddressToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :address, :string
    add_column :venues, :bad_weather_capacity, :string
    add_column :venues, :deposit, :string
    add_column :venues, :onsite_accommodation, :string
  end
end

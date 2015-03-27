class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :description
      t.string :pricing
      t.string :contact_details
      t.string :website
      t.string :services
      t.json :photos
      t.timestamps
    end
  end
end

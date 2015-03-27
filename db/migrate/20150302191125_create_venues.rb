class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |table_column|
      table_column.string :name
      table_column.string :description
      table_column.string :pricing
      table_column.string :directions
      table_column.string :website
      table_column.string :contact_details
      table_column.string :size_details
      table_column.timestamps
    end
  end
end

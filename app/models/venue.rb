class Venue < ActiveRecord::Base
  validates_presence_of :name, :contact_details
  validates_uniqueness_of :name, case_sensitive: false

  has_and_belongs_to_many :preferred_vendors, class_name: "Vendor"

  mount_uploaders :photos, PhotoUploader
end

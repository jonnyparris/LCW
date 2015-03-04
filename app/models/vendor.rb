class Vendor < ActiveRecord::Base
  validates_presence_of :name, :contact_details
  validates_uniqueness_of :name, case_sensitive: false

  mount_uploaders :photos, PhotoUploader
end

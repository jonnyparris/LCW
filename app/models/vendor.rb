class Vendor < ActiveRecord::Base
  validates_presence_of :name, :contact_details
  validates_uniqueness_of :name, case_sensitive: false

  has_and_belongs_to_many :preferred_venues, class_name: "Venue"

  mount_uploaders :photos, PhotoUploader

  before_save :prepend_url

  def prepend_url
    return if self.website? && /^http/i.match(self.website)
    self.website = "http://#{self.website}"
  end
end

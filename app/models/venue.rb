class Venue < ActiveRecord::Base
  validates_presence_of :name, :contact_details
  validates_uniqueness_of :name, case_sensitive: false

  has_and_belongs_to_many :preferred_vendors, class_name: "Vendor"

  mount_uploaders :photos, PhotoUploader

  before_save :prepend_url

  def prepend_url
    return if self.website? && /^http/i.match(self.website)
    self.website = "http://#{self.website}"
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |venue|
        csv << venue.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    raise "No file uploaded" if file.nil?
    spreadsheet = open_spreadsheet(file)
    bad_eggs = []
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      venue = find_by_id(row["id"]) || new
      venue.attributes = row.to_hash.slice(*accessible_attributes)
      venue.remote_photos_urls = [row["new_photos"]] unless row["new_photos"].nil?
      if venue.valid? == false
        bad_eggs << [venue.name, venue.errors.full_messages]
      else
        venue.save!
      end
    end
    if bad_eggs.empty?
      "success"
    else
      "some success, some bad eggs: #{bad_eggs.to_s}"
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path, csv_options: { :encoding => 'windows-1251:utf-8' })
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def self.accessible_attributes
   ["name",
    "description",
    "pricing",
    "directions",
    "website,",
    "contact_details",
    "size_details",
    "children_friendly",
    "disabled_access",
    "address",
    "bad_weather_capacity",
    "deposit",
    "onsite_accommodation"]
  end
end

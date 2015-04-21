namespace :db do
  desc "load files from CSV into db"
  task upload: :environment do
    require 'csv'
    filename = ARGV.last
    CSV.foreach(filename, :headers => true, :encoding => 'windows-1251:utf-8') do |row|
      line = "*"*15
      new_venue = Venue.new
      row.to_hash.each do |h|
        key = h[0]
        value = h[1]
        puts "#{line*4}\n#{line}Loading Venue: #{value} #{line}\n#{line*4}\n" if key == "name"
        new_venue[key] = value unless key == "photos"
        puts "===> #{key}: #{value}"
      end
      new_venue.remote_photos_urls = [row["photos"]] unless row["photos"].nil?
      print "Saved? "
      p new_venue.save
    end
  end
end

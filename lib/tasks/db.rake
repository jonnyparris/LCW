namespace :db do
  desc "load files from CSV into db"
  task upload: :environment do
    require 'csv'
    filename = ARGV.last
    bad_eggs = []
    CSV.foreach(filename, :headers => true, :encoding => 'windows-1251:utf-8') do |row|
      line = "*"*15
      new_venue = Venue.new
      row.to_hash.each do |h|
        key = h[0]
        value = h[1]
        puts "#{line*4}\n#{line}Loading Venue: #{value} #{line}\n#{line*4}\n" if key == "name"
        new_venue[key] = value unless key == "photos"
      end
      new_venue.remote_photos_urls = [row["photos"]] unless row["photos"].nil?
      if new_venue.valid? == false
        puts "BAD EGG"
        bad_eggs << [new_venue.name, new_venue.errors.full_messages]
      else
        new_venue.save
      end
    end
    bad_eggs.each { |egg| puts "#{egg[0]} FAILED: #{egg[1]}" } unless bad_eggs.empty?
  end
end

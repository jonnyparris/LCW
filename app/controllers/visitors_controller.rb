class VisitorsController < ApplicationController

  def index
    @venues = Venue.all
    @vendors = Vendor.all unless Vendor.all.empty?
  end

end

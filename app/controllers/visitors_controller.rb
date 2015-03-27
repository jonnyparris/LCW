class VisitorsController < ApplicationController

  def index
    @venues = Venue.includes(:preferred_vendors).all
    @vendors = Vendor.includes(:preferred_venues).all unless Vendor.all.empty?
  end

end

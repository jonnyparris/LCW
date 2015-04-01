class VisitorsController < ApplicationController

  def index
    if params[:filter].nil?
      @venues = Venue.includes(:preferred_vendors).all unless Venue.all.empty?
    else
      @venues = Venue.includes(:preferred_vendors).where("pricing < ? AND size_details > ?", params[:max_price], params[:min_capacity])
    end
    @vendors = Vendor.includes(:preferred_venues).all unless Vendor.all.empty?
  end

end

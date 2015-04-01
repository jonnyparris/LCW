class VisitorsController < ApplicationController

  def index
    if params[:filter].nil?
      @venues = Venue.includes(:preferred_vendors).all unless Venue.all.empty?
    else
      @venues = Venue.includes(:preferred_vendors)
        .where("pricing < ? AND size_details > ? AND children_friendly = ? AND disabled_access = ?",
                params[:max_price],
                params[:min_capacity],
                params[:children_friendly] != nil,
                params[:disabled_access] != nil)
    end
    @vendors = Vendor.includes(:preferred_venues).all unless Vendor.all.empty?
  end

end

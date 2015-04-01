class VisitorsController < ApplicationController

  def index
    if params[:filter].nil?
      @venues = Venue.includes(:preferred_vendors).all unless Venue.all.empty?
    else
      children_friendly = params[:children_friendly] ? "true" : "false"
      disabled_access = params[:disabled_access] ? "true" : "false"
      @venues = Venue.includes(:preferred_vendors)
        .where("pricing < ? AND size_details > ? AND children_friendly = ? AND disabled_access = ?",
                params[:max_price],
                params[:min_capacity],
                children_friendly,
                disabled_access)
    end
    @vendors = Vendor.includes(:preferred_venues).all unless Vendor.all.empty?
  end

end

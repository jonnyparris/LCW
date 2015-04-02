class VisitorsController < ApplicationController

  def index
    if params[:commit] == "Filter"
      children_friendly = params[:children_friendly] ? "true" : "false"
      disabled_access = params[:disabled_access] ? "true" : "false"
      @venues = Venue.includes(:preferred_vendors)
                      .where("pricing < ?
                              AND size_details > ?
                              AND children_friendly = ?
                              AND disabled_access = ?",
                              params[:max_price],
                              params[:min_capacity],
                              children_friendly,
                              disabled_access) unless Venue.all.empty? || params[:vendors_only]
    else
      @venues = Venue.includes(:preferred_vendors).all unless Venue.all.empty? || params[:vendors_only]
    end
    @vendors = Vendor.includes(:preferred_venues).all unless Vendor.all.empty? || params[:venues_only]
  end

end

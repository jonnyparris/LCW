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
                              disabled_access)
                              .order(sort_column + " " + sort_direction) unless Venue.all.empty? || params[:vendors_only]
    else
      @venues = Venue.includes(:preferred_vendors).order(sort_column + " " + sort_direction) unless Venue.all.empty? || params[:vendors_only]
    end
    @vendors = Vendor.includes(:preferred_venues) unless Vendor.all.empty? || params[:venues_only]
  end

  private

  def sort_column
    Venue.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w(asc desc).include?(params[:sort_direction]) ? params[:sort_direction] : "asc"
  end
end

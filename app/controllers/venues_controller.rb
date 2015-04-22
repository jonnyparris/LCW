class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  respond_to :html

  def index
    @venues = Venue.all
    respond_to do |format|
      format.html { respond_with(@venues) }
      format.csv  { send_data @venues.to_csv }
    end
  end

  def show
    respond_with(@venue)
  end

  def new
    @venue = Venue.new
    respond_with(@venue)
  end

  def edit
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.save
    redirect_to venues_path
  end

  def update
    @venue.update(venue_params)
    respond_with(@venue)
  end

  def destroy
    @venue.destroy
    respond_with(@venue)
  end

  def import
    import_results = Venue.import(params[:file])
    if import_results == "success"
      redirect_to venues_path, notice: "Venues imported. No bad eggs"
    elsif import_results[0] == "s"
      redirect_to venues_path, alert: import_results
    else
      redirect_to venues_path, alert: "Nothing imported - did you select a file?"
    end
  end

  private
    def set_venue
      @venue = Venue.find(params[:id])
    end

    def venue_params
      params[:venue].permit(:name,
                            :description,
                            :pricing,
                            :directions,
                            :website,
                            :contact_details,
                            :size_details,
                            :photos => [])
    end
end

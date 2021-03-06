class ConferencesController < ApplicationController
  before_action :set_conference, only: [:show, :edit, :update, :destroy, :speakers, :participants]

  # GET /conferences
  # GET /conferences.json
  def index
    @conferences = Conference.order(created_at: :desc).page(params[:page])
  end

  # GET /conferences/1
  # GET /conferences/1.json
  def show
  end

  def speakers
    @speakers = @conference.speakers
    render 'speakers/index'
  end

  # GET /conferences/new
  def new
    @conference = Conference.new
  end

  # GET /conferences/1/edit
  def edit
  end

  def participants
    render json: @conference.participants
  end

  # POST /conferences
  # POST /conferences.json
  def create
    @conference = Conference.new(conference_params)
    if @conference.save
      render :show, status: :created, location: @conference
    else
      render json: @conference.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /conferences/1
  # PATCH/PUT /conferences/1.json
  def update
    respond_to do |format|
      if @conference.update(conference_params)
        format.json { render :show, status: :ok, location: @conference }
      else
        format.json { render json: @conference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conferences/1
  # DELETE /conferences/1.json
  def destroy
    @conference.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conference
      @conference = Conference.find_by(slug: params[:slug])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conference_params
      params.require(:conference).permit(:title, :location, :description, :image_url, :start_date, :duration, :price, :slug, ticket_prices_attributes: [:ticket_type, :price])
    end
end

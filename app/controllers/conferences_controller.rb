class ConferencesController < ApplicationController
  before_action :set_conference, only: [:show, :edit, :update, :destroy, :speakers]

  # GET /conferences
  # GET /conferences.json
  def index
    @conferences = Conference.all
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

  # POST /conferences
  # POST /conferences.json
  def create
    @conference = Conference.new(conference_params)

    respond_to do |format|
      if @conference.save
        format.json { render :show, status: :created, location: @conference }
      else
        format.json { render json: @conference.errors, status: :unprocessable_entity }
      end
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
      @conference = Conference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conference_params
      params.require(:conference).permit(:title, :location, :description, :image_url, :start_date)
    end
end

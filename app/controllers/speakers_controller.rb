class SpeakersController < ApplicationController
  before_action :set_speaker, only: [:show, :edit, :update, :destroy]
  before_action :set_conference, only: [:add_speaker_to_conference]

  # GET /speakers
  # GET /speakers.json
  def index
    @speakers = Speaker.all
  end

  # GET /speakers/1
  # GET /speakers/1.json
  def show
  end

  # GET /speakers/new
  def new
    @speaker = Speaker.new
  end

  # GET /speakers/1/edit
  def edit
  end

  # POST /speakers
  # POST /speakers.json
  def create
    @speaker = Speaker.new(speaker_params)

    respond_to do |format|
      if @speaker.save
        format.json { render :show, status: :created, location: @speaker }
      else
        format.json { render json: @speaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /speakers/1
  # PATCH/PUT /speakers/1.json
  def update
    respond_to do |format|
      if @speaker.update(speaker_params)
        format.json { render :show, status: :ok, location: @speaker }
      else
        format.json { render json: @speaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /speakers/1
  # DELETE /speakers/1.json
  def destroy
    @speaker.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def add_speaker_to_conference
    @speaker = Speaker.create(speaker_params)
    if @speaker.save
      @speaker.conferences << @conference
      render :show, status: :ok, location: @speaker
    else
      render json: @speaker.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_speaker
      @speaker = Speaker.find(params[:id])
    end

    def set_conference
      @conference = Conference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def speaker_params
      params.fetch(:speaker).permit(:name, :role, :linkedin_handle, :twitter_handle, :github_handle, :company, :company_logo, :profile_pic, :speaker_summary, :mobile_number, :country, :city, :about_page, :birthday, :email, :languages_known => [])
    end
end

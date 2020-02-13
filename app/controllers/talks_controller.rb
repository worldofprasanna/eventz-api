class TalksController < ApplicationController
  before_action :get_conference
  before_action :set_talk, only: [:show, :edit, :update, :destroy]

  # GET /talks
  # GET /talks.json
  def index
    @talks = @conference.talks
  end

  # GET /talks/1
  # GET /talks/1.json
  def show
  end

  # GET /talks/new
  def new
    @talk = @conference.talks.build
  end

  # GET /talks/1/edit
  def edit
  end

  # POST /talks
  # POST /talks.json
  def create
    @talk = @conference.talks.build(talk_params)

    if @talk.save
      render :show, status: :created
    else
      format.json { render json: @talk.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /talks/1
  # PATCH/PUT /talks/1.json
  def update
    respond_to do |format|
      if @talk.update(talk_params)
        format.json { render :show, status: :ok, location: @talk }
      else
        format.json { render json: @talk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /talks/1
  # DELETE /talks/1.json
  def destroy
    @talk.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_conference
      @conference = Conference.find(params[:conference_id])
    end

    def set_talk
      @talk = @conference.talks.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def talk_params
      params.require(:talk).permit(:title, :start_time, :description, :speaker_id, :talk_type)
    end
end

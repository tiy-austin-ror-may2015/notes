class ScreencastsController < ApplicationController
  before_action :set_screencast, only: [:show, :edit, :update, :destroy]

  # GET /screencasts
  # GET /screencasts.json
  def index
    @screencasts = Screencast.all
  end

  # GET /screencasts/1
  # GET /screencasts/1.json
  def show
  end

  # GET /screencasts/new
  def new
    @screencast = Screencast.new
  end

  # GET /screencasts/1/edit
  def edit
  end

  # POST /screencasts
  # POST /screencasts.json
  def create
    @screencast = Screencast.new(screencast_params)

    respond_to do |format|
      if @screencast.save
        format.html { redirect_to @screencast, notice: 'Screencast was successfully created.' }
        format.json { render :show, status: :created, location: @screencast }
      else
        format.html { render :new }
        format.json { render json: @screencast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /screencasts/1
  # PATCH/PUT /screencasts/1.json
  def update
    respond_to do |format|
      if @screencast.update(screencast_params)
        format.html { redirect_to @screencast, notice: 'Screencast was successfully updated.' }
        format.json { render :show, status: :ok, location: @screencast }
      else
        format.html { render :edit }
        format.json { render json: @screencast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /screencasts/1
  # DELETE /screencasts/1.json
  def destroy
    @screencast.destroy
    respond_to do |format|
      format.html { redirect_to screencasts_url, notice: 'Screencast was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_screencast
      @screencast = Screencast.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def screencast_params
      params.require(:screencast).permit(:title, :url, :price)
    end
end

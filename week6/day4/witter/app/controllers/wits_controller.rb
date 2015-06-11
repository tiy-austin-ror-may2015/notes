class WitsController < ApplicationController
  before_action :set_wit, only: [:show, :edit, :update, :destroy]

  # GET /wits
  def index
    @wits = Wit.all
  end

  # GET /wits/1
  def show
  end

  # GET /wits/new
  def new
    authenticate_user!
    @wit = Wit.new
    @all_users = User.select_users
  end

  # GET /wits/1/edit
  def edit
  end

  # POST /wits
  def create
    @wit = Wit.new(wit_params)

    if @wit.save
      redirect_to @wit, notice: 'Wit was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /wits/1
  def update
    if @wit.update(wit_params)
      redirect_to @wit, notice: 'Wit was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /wits/1
  def destroy
    @wit.destroy
    redirect_to wits_url, notice: 'Wit was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wit
      @wit = Wit.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def wit_params
      params.require(:wit).permit(:body, :user_id)
    end
end

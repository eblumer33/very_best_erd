class VeryBestsController < ApplicationController
  before_action :set_very_best, only: [:show, :edit, :update, :destroy]

  # GET /very_bests
  def index
    @very_bests = VeryBest.all
  end

  # GET /very_bests/1
  def show
  end

  # GET /very_bests/new
  def new
    @very_best = VeryBest.new
  end

  # GET /very_bests/1/edit
  def edit
  end

  # POST /very_bests
  def create
    @very_best = VeryBest.new(very_best_params)

    if @very_best.save
      redirect_to @very_best, notice: 'Very best was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /very_bests/1
  def update
    if @very_best.update(very_best_params)
      redirect_to @very_best, notice: 'Very best was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /very_bests/1
  def destroy
    @very_best.destroy
    redirect_to very_bests_url, notice: 'Very best was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_very_best
      @very_best = VeryBest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def very_best_params
      params.require(:very_best).permit(:user_id, :dish_id, :venue_id)
    end
end
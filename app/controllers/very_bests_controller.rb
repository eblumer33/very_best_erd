class VeryBestsController < ApplicationController
  before_action :current_user_must_be_very_best_user,
                only: %i[edit update destroy]

  before_action :set_very_best, only: %i[show edit update destroy]

  def index
    @q = current_user.very_bests.ransack(params[:q])
    @very_bests = @q.result(distinct: true).includes(:venue, :dish,
                                                     :user).page(params[:page]).per(10)
  end

  def show; end

  def new
    @very_best = VeryBest.new
  end

  def edit; end

  def create
    @very_best = VeryBest.new(very_best_params)

    if @very_best.save
      message = "VeryBest was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @very_best, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @very_best.update(very_best_params)
      redirect_to @very_best, notice: "Very best was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @very_best.destroy
    message = "VeryBest was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to very_bests_url, notice: message
    end
  end

  private

  def current_user_must_be_very_best_user
    set_very_best
    unless current_user == @very_best.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_very_best
    @very_best = VeryBest.find(params[:id])
  end

  def very_best_params
    params.require(:very_best).permit(:user_id, :dish_id, :venue_id)
  end
end

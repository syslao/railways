class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  PARAMS = {
    EconomyCarriage:  %i[top_seats bottom_seats side_bottom_seats side_top_seats],
    CoupeCarriage:    %i[top_seats bottom_seats],
    BusinessCarriage: %i[bottom_seats],
    SittingCarriage:  %i[seats]
  }.freeze

  def index
    @carriages = Carriage.all
  end

  def show
  end

  def new
    @carriage = Carriage.new
  end

  def edit
  end

  def create
    @carriage = Carriage.new(carriage_params)
    if @carriage.save
      redirect_to carriage_path(@carriage), notice: 'Carriage was successfully created.'
    else
      render :new
    end
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to carriage_path(@carriage), notice: 'Carriage was successfully created.'
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to carriages_url, notice: 'Carriage was successfully destroyed.'
  end

  private

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(:train_id, :type, permitted_params)
  end

  def permitted_params
    PARAMS[params[:carriage][:type].to_sym]
  end
end

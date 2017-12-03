class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]
  before_action :set_train,    only: [:new, :create, :edit, :update]

  PARAMS = {
    EconomyCarriage:  %i[top_seats bottom_seats side_bottom_seats side_top_seats],
    CoupeCarriage:    %i[top_seats bottom_seats],
    BusinessCarriage: %i[bottom_seats],
    SittingCarriage:  %i[seats]
  }.freeze

  def index
  end

  def show
  end

  def new
    @carriage = Carriage.new
  end

  def edit
  end

  def create
    @carriage = @train.carriages.new(carriage_params)

    if @carriage.save
      redirect_to train_path(@train), notice: 'Carriage was successfully created.'
    else
      render :new
    end

  end

  def update
    if @carriage.update(carriage_params)
      redirect_to train_path(@train), notice: 'Carriage was successfully created.'
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to train_path(@carriage.train), notice: 'Carriage was successfully destroyed.'
  end

  private

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  def carriage_params
    params.require(:carriage).permit(:train_id, :type, permitted_params)
  end

  def permitted_params
    params[:carriage][:type].constantize::AVAILABLE_SEATS
  end
end

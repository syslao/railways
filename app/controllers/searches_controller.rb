class SearchesController < ApplicationController

  def show
  end

  def create
    @trains = Search.find_train(params[:departure_station], params[:arrival_station])

    if @trains.present?
      @departure_station = RailwayStation.find(params[:departure_station])
      @arrival_station = RailwayStation.find(params[:arrival_station])
      render :show
    else
      redirect_to search_path, notice: 'Ничего не найдено.'
    end
  end
end

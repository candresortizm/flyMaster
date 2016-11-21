class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to cities_path
    else
      render 'new'
    end
  end

  def edit
    @city = City.find_by(id: params[:id])
  end

  def update
    @city = City.find_by(id: params[:id])
    if @city.update_attributes(city_params)
      redirect_to cities_path
    else
      render 'edit'
    end
  end

  def destroy
    city = City.find_by(id: params[:id])
    if city.destroy
      flash[:success] = "City Destroyed Successfully"
    else
      flash[:error] = "Houston we are in troubles, please try it later"
    end
    redirect_to cities_path

  end

  private

  #strong parameters
  def city_params
    params.require(:city).permit(:name, :country_name, :time_zone)
  end

end

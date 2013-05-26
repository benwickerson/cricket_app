class CountriesController < ApplicationController

  def index
    @countries = Country.paginate(page: params[:page])
  end

end

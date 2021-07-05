require 'pry-byebug'

class PagesController < ApplicationController
  def autocomplete
    results = AutocompleteSearchService.new(params[:q]).call
    if results.size != 0
      render json: results
    else
      flash.now[:notice] = "API call limit reached, pls try again in 1 min 👷‍♂️"
    end
  end
end

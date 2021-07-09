class PagesController < ApplicationController
  def autocomplete
    results = AutocompleteSearchService.new(params[:q]).call
    render json: results, status: 200
  end
end

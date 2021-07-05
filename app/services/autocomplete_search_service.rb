require 'pry-byebug'

class AutocompleteSearchService
  include HTTParty
  base_uri "https://api.github.com/"

  def initialize(term)
    @term = term
  end

  def call
    { repos: repos }
  end

  private

  def repos
    response = self.class.get("/search/repositories", query: { q: @term })
    response["items"].map { |item| item["full_name"] }.first(10)
  end
end
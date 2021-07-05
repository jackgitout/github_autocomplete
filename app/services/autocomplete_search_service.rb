require 'pry-byebug'

class AutocompleteSearchService
  include HTTParty
  base_uri "https://api.github.com/"

  def initialize(term)
    @term = term
  end

  def call
    { repos: repos, users: users }
  end

  private

  def repos
    response = self.class.get("/search/repositories", query: { q: @term })
    response["items"].map { |item| item["full_name"] }.first(5)
  end

  def users
    response = self.class.get("/search/users", query: { q: @term + " "})
    response["items"].map { |item| item["login"] }.first(5)
  end
end
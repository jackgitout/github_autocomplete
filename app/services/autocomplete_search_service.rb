class AutocompleteSearchService
  include HTTParty
  base_uri 'https://api.github.com/'

  def initialize(term)
    @term = term
  end

  def call
    { repos: repos, users: users }
  end

  private
  
  def repos
    limit_check('repositories', 'full_name')
  end

  def users
    limit_check('users', 'login')
  end

  def limit_check(qualifier, key_word)
    response = self.class.get("/search/#{qualifier}",  headers: { 'Authorization' => "token #{ENV['GITHUB_TOKEN']}" }, query: { q: @term })
    if response.key?('items')
      response['items'].map { |item| item[key_word] }.first(5)
    else
      response = []
    end
  end
end
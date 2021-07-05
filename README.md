# README

Simple AJAX autocomplete rails app that gets responses from GitHub's Search API 

* Ruby version 2.6.6

* Configuration
  - Autocompleter: js-autocomplete
  https://github.com/Pixabay/JavaScript-autoComplete
  - Github API Query Gem: HTTParty
  https://github.com/jnunemaker/httparty
  
TO-DO
1. Set up Rails app with Pages Controller & View
2. Add NPM package & gems (js-autocomplete, HTTParty, RSPEC etc)
3. Create RSPEC files
4. Add autocomplete method to PagesController which runs search and render search results to view
5. Create Class for search (AutocompleteSearchService) according to HTTParty documentation
6. API query format to follow GitHub Search documentation
7. Set up rails route for root & /autocomplete, executed when user inputs into search box
8. Create view pages#home with form containing searchbox
9. Create autocomplete.js with js-autocomplete NPM and target user's search input
10. Set up JS packs and asset pipeline according for js-autocomplete to work properly

# README

Simple AJAX autocomplete rails app that gets repository and username responses from GitHub's Search API 

# Getting Started
  
1. To get started with the app, first clone the repo and <code>cd</code> into the directory:
  
        $ git clone https://github.com/jackgitout/github_autocomplete.git
        $ cd github_autocomplete

2. Install the necessary packages

        yarn
        gem install bundler
        bundle install
        
3. Run the tests to verify that the app is functioning properly

        rake
    
4. To increase the GitHub API call limit, obtain personal access token via GitHub. 
   https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token

    4.1. Create .ENV file to contain GitHub personal access token (PAT)

        touch .env
    
    4.2. Add your token to the .ENV file (do not leave your PAT anywhere else in the code)

        GITHUB_TOKEN=INSERT_TOKEN_HERE
        
5. Start rails server to begin using the web-app

        rails server

# Setup

* Ruby version 2.6.6

* Dependencies
  - Autocompleter: js-autocomplete
  https://github.com/Pixabay/JavaScript-autoComplete
  - Github API Query Gem: HTTParty
  https://github.com/jnunemaker/httparty

# Extra Info (Beginning from Scratch)
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

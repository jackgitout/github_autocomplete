require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe "GET #autocomplete" do
    it "returns http success" do
      json_response = File.open("spec/fixtures/repository_response.json")
      stub_request(:get, "https://api.github.com/search/repositories?q=").
        to_return(status: 200, body: json_response)
    end

    it "JSON body response contains expected search qualifiers" do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(['repos', 'users'])
    end
  end
end

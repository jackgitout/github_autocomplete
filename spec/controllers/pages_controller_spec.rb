require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe "GET #autocomplete" do
    before do
      get :autocomplete
    end
  
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected search qualifiers" do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(['repos', 'users'])
    end
  end
end

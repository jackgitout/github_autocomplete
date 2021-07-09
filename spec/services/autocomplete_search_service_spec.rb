require 'rails_helper'

RSpec.describe AutocompleteSearchService do
    describe '#call' do
    context 'Single repo search qualifier' do
      json_response = File.open("spec/fixtures/repository_response.json")

      it 'returns a Hash of results' do
        stub_request(:get, "https://api.github.com/search/repositories?q=Ruby%20Rails").
          to_return(status: 200, body: json_response, headers: {})

        registered stubs:

        stub_request(:get, "https://api.github.com/search/users?q=Ruby%20Rails")
      
        expect(AutocompleteSearchService.new("Ruby Rails").call.class).to eq(Hash)
      end

      it 'returns a Array of 5 repo results' do
        expect(subject.call[:repos].size).to eq(5)
      end
    end

    context 'Two search qualifiers repo and users' do
      subject { described_class.new("jack") }

      it 'returns a Hash of 2 key/value pair' do
        expect(subject.call.size).to eq(2)
      end

      it 'returns a Array of 5 user results' do
        expect(subject.call[:users].size).to eq(5)
      end
    end
  end
end
require 'rails_helper'

RSpec.describe AutocompleteSearchService do
  describe '#call' do
    context 'Single repo search qualifier' do
      subject { described_class.new("ridenow") }

      it 'returns a Hash of results' do
        expect(subject.call.class).to eq(Hash)
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
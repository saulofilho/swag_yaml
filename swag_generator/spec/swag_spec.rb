
# frozen_string_literal: true

require 'pry-byebug'
require './app/controllers/swag_generator/swag'
# require './swag_generator/swag'

describe SwagGenerator::Swag do
  context 'generates swag' do
    let(:config) { SwagGenerator::Swag.config { extend SwagGenerator } }
    let(:merge) { SwagGenerator::Swag.merge { extend SwagGenerator } }
    let(:path) { SwagGenerator::Swag.path('get') { extend SwagGenerator } }

    it 'when successful' do
      expect(config).to eq nil
      expect(merge).to eq nil
      expect(path).to eq nil
    end
  end
end

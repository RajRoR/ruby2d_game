# frozen_string_literal: true

require_relative '../dependencies'

describe Game do
  let(:game) { described_class.new }

  describe '#start' do
    it 'shows the game window' do
      expect(Window).to receive(:show)

      game.start
    end
  end
end

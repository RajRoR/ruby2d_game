# frozen_string_literal: true

require_relative './../dependencies'

describe ScoreBoard do
  subject(:score_board) { described_class.new }

  describe '#show' do
    it 'shows the score and lives' do
      ['Your Score: 0', 'Lives Remaining: 5'].each do |text|
        expect(Text).to receive(:new).with(text, anything)
      end

      score_board.show
    end
  end
end

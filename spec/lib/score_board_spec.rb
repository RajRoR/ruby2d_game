# frozen_string_literal: true

require_relative '../dependencies'

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

  context 'when updating lives or score' do
    before { score_board.show }

    describe '#update_lives' do
      it 'decrement lives' do
        expect { score_board.update_lives }.to change(score_board, :lives).by(-1)
      end
    end

    describe '#update_score' do
      it 'increment score' do
        expect { score_board.update_score }.to change(score_board, :score).by(1)
      end
    end
  end
end

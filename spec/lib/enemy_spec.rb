# frozen_string_literal: true

require_relative '../dependencies'

describe Enemy do
  subject(:enemy) { described_class.new(width: 10, height: 10, image: 'spec/assets/enemy.png') }

  describe '#draw' do
    it 'creates an enemy actor' do
      enemy.draw

      expect(enemy.actor).not_to be_nil
    end
  end
end

# frozen_string_literal: true

require './dependencies'

describe Enemy::ZombiePlant do
  let(:zombie_plant) { described_class.new }

  describe '#descend' do
    it 'updates the plant position' do
      zombie_plant.draw
      zombie_plant.descend

      plant = zombie_plant.actor

      expect {
        Window.current.update_callback
      }.to change(plant, :x).and(change(plant, :y))
    end
  end
end

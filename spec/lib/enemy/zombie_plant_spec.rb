# frozen_string_literal: true

require './dependencies'

describe Enemy::ZombiePlant do
  let(:zombie_plant) { described_class.new }

  describe '#descend' do
    it 'updates the plant position' do
      zombie_plant.plot
      plant = zombie_plant.actor

      expect do
        Window.current.update_callback
      end.to change(plant, :x).and(change(plant, :y))
    end
  end
end

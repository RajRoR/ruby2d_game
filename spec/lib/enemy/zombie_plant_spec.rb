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

  describe '#immune' do
    it 'increases zombie plany size' do
      zombie_plant.plot
      plant = zombie_plant.actor

      expect do
        zombie_plant.immune
      end.to change(plant, :width).to(plant.width * 1.4).and(change(plant, :height).to(plant.height * 1.4))
    end
  end

  describe '#destroy' do
    it 'destroys the zombie plant' do
      zombie_plant.plot

      expect(zombie_plant.actor).to receive(:remove)

      zombie_plant.destroy
    end
  end
end

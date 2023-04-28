# frozen_string_literal: true

class Enemy
  # @example Draw a {ZombiePlant}
  #   ZombiePlant.new.draw
  class ZombiePlant < Enemy
    def initialize
      super(width: 125, height: 125, image: 'assets/zombie-plant.png')
    end
  end
end

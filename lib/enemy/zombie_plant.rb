# frozen_string_literal: true

class Enemy
  # @example Draw a {ZombiePlant}
  #   ZombiePlant.new.draw
  class ZombiePlant < Enemy
    def initialize
      super(width: 125, height: 125, image: 'assets/zombie-plant.png')
    end

    # Move the plant towards bottom of the screen.
    #
    # @return [void]
    def descend(&proc)
      x_direction = [-1, 1].sample

      x_limit = Window.width - width
      y_limit = (Window.height * rand(0.7..1)) - height

      Window.update do
        actor.x += x_direction if actor.x.positive? && actor.x < x_limit

        # yield unless actor.y < y_limit

        actor.y += 1
      end
    end
  end
end

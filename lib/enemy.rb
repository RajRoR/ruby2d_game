# frozen_string_literal: true

# This handles all the basic operations for an enemy actor.
#
# @example Draw an enemy
#   Enemy.new(width: 20, height: 50, image: 'assets/enemy.png').draw
#
class Enemy
  attr_accessor :actor, :height, :width

  CLIP_LAPS_TIME = 150

  def initialize(width:, height:, image:)
    @width = width
    @height = height
    @image = image
  end

  # Draw the enemy actor on the screen at a random position.
  #
  # @return [Sprite] the drawn actor.
  def draw
    x_padding = width / 2
    y_padding = height / 2

    # TODO: Define `clip_width` to animate
    @actor = Sprite.new(
      @image,
      x: rand(x_padding..(Window.width - x_padding)),
      y: rand(y_padding..((Window.height * 0.5) - y_padding)),
      clip_width: width,
      time: CLIP_LAPS_TIME,
      animations: animations
    )

    actor.play animation: :fly, loop: true
  end

  private

  def animations
    {
      fly: [
        { x: 0, y: 0 },
        { x: width, y: 0 },
        { x: 0, y: height },
        { x: width, y: height }
      ].map { |coords| coords.merge({ width: width, height: height, time: CLIP_LAPS_TIME }) }
    }
  end
end

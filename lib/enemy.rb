# frozen_string_literal: true

# This handles all the basic operations for an enemy actor.
#
# @example Draw an enemy
#   Enemy.new(width: 20, height: 50, image: 'assets/enemy.png').draw
#
class Enemy
  attr_accessor :actor, :height, :width

  def initialize(width:, height:, image:)
    @width = width
    @height = height
    @image = image
  end

  # Destroy the actor
  #
  # @return [void]
  def destroy
    Sprite.new(
      'assets/bulls-eye.png',
      x: actor.x,
      y: actor.y,
      clip_width: width,
      clip_height: height,
      width: width,
      height: height,
      time: 75
    ).play

    actor.remove
  end

  # Draw the enemy actor on the screen at a random position.
  #
  # @return [Sprite] the drawn actor.
  def draw
    origin_coords = random_origin_coords

    @actor = Sprite.new(
      @image,
      x: origin_coords[:x],
      y: origin_coords[:y],
      clip_width: width,
      width: width,
      height: height,
      animations: animations
    )

    actor.play animation: :fly, loop: true
  end

  def immune
    actor.height *= 1.4
    actor.width *= 1.4
  end

  private

  # Fly animation for the actor.
  #
  # @return [Hash<Symbol, Array<Hash<Symbol, Integer>>>]
  def animations
    {
      fly: [
        { x: 0, y: 0 },
        { x: width, y: 0 },
        { x: 0, y: height },
        { x: width, y: height }
      ].map { |coords| coords.merge({ width: width, height: height, time: 150 }) }
    }
  end

  # Random co-ordinates for the origin of the actor.
  #
  # @return [Hash<Symbol, Integer>] the 'x' and 'y' co-ordinates value.
  def random_origin_coords
    x_padding = width / 2
    y_padding = height / 2

    {
      x: rand(x_padding..(Window.width - x_padding)),
      y: rand(y_padding..((Window.height * 0.5) - y_padding))
    }
  end
end

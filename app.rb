# frozen_string_literal: true

require_relative 'dependencies'

set width: 1200
set height: 900

set background: Image.new(
  'assets/background.jpg',
  width: Window.width,
  height: Window.height
)

set title: 'Rescue Your Farm – An action-packed gaming experience!'

# Register 'mouse down' event.
on :mouse_down do
  @zombie_plant = Enemy::ZombiePlant.new

  @zombie_plant.draw
end

# Start the game.
@game = Game.new
@game.start

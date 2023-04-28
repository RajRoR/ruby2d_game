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

@zombie_plant = Enemy::ZombiePlant.new

# Register 'mouse down' event.
on :mouse_down do
  plant = @zombie_plant.actor

  if plant.nil?
    @zombie_plant.draw
    @zombie_plant.descend
  end
end

# Start the game.
@game = Game.new
@game.start

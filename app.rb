# frozen_string_literal: true

require_relative 'dependencies'

set width: 800
set height: 600

set background: Image.new(
  'assets/background.jpg',
  width: Window.width,
  height: Window.height
)

set title: 'Rescue Your Farm – An action-packed gaming experience!'

@zombie_plant = Enemy::ZombiePlant.new

# Register 'mouse down' event.
on :mouse_down do |event|
  plant = @zombie_plant.actor

  if plant.nil?
    @zombie_plant.plot
  elsif plant.contains?(event.x, event.y)
    @zombie_plant.destroy

    @zombie_plant = Enemy::ZombiePlant.new
    @zombie_plant.plot
  end
end

# Start the game!!!
@game = Game.new
@game.start

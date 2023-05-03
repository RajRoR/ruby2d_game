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
    @zombie_plant.plot { zombie_plant_immuned }
  elsif plant.contains?(event.x, event.y)
    @zombie_plant.destroy
    @game.update_score

    plot_zombie_plant
  end
end

def plot_zombie_plant
  @zombie_plant = Enemy::ZombiePlant.new
  @zombie_plant.plot { zombie_plant_immuned }
end

# Handle the scenario when zombie plant gets immuned.
# Acts as a callback.
def zombie_plant_immuned
  @zombie_plant.immune
  @game.update_lives

  plot_zombie_plant
end

# Start the game!!!
@game = Game.new
@game.start

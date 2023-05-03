# frozen_string_literal: true

# Handles the game operations such as starting the game, ending, scoring, etc.
#
# @example Start the game
#   Game.new.start
class Game
  def initialize
    @score_board = ScoreBoard.new
  end

  # Start and show the game window.
  #
  # @return [void]
  def start(bg_music_file: 'assets/scary-music.mp3.flac')
    start_music(bg_music_file)
    @score_board.show

    Window.show
  end

  private

  # Show the "Game Over" screen with scores.
  #
  # @return [void]
  def over
    Rectangle.new(width: Window.width, height: Window.height, opacity: 70, color: 'teal', z: 10)

    Text.new('Game Over...', color: 'white', x: ((Window.width / 2) - 150), y: 150, size: 50, z: 11)
    Text.new('Your Score: 0', color: 'white', x: ((Window.width / 2) - 100), y: 220, size: 30, z: 11)
  end

  # Start background music on loop.
  #
  # @return [void]
  def start_music(file)
    music = Music.new(file, loop: true)
    music.play
  end
end

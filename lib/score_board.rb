# frozen_string_literal: true

# Handles the score board operations such as incrementing score and decrementing lives.
#
# @example Show the score board.
#   ScoreBoard.new.show
class ScoreBoard
  attr_accessor :lives, :score

  def initialize(lives: 5, score: 0)
    @lives = lives
    @score = score
  end

  def show
    @score_obj = Text.new(score_text, color: 'white', x: (Window.width - 200), y: 10, size: 20)
    @lives_obj = Text.new(lives_text, color: 'white', x: (Window.width - 200), y: 30, size: 20)
  end

  def update_lives
    @lives -= 1
    @lives_obj.text = lives_text
  end

  def update_score
    @score += 1
    @score_obj.text = score_text
  end

  private

  def score_text
    "Your Score: #{@score}"
  end

  def lives_text
    "Lives Remaining: #{@lives}"
  end
end

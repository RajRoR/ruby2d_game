# frozen_string_literal: true

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

  private

  def score_text
    "Your Score: #{@score}"
  end

  def lives_text
    "Lives Remaining: #{@lives}"
  end
end

class PuzzlesController < ApplicationController

  def index
    @puzzles = Puzzle.all
    render json: @puzzles
  end

  def create
    @puzzle = Puzzle.new(puzzle_params)
    render json: @puzzle
  end

  private

    def puzzle_params
      require(:puzzle).permit(:board)
    end

end

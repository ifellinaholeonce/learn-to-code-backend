class PuzzlesController < ApplicationController

  def show
    @puzzle = Puzzle.find(params[:id])
    render json: @puzzle
  end

  def index
    @puzzles = Puzzle.all
    render json: @puzzles
  end

  def new
    @puzzle = Puzzle.new(puzzle_params)
  end

  private

    def puzzle_params
      require(:puzzle).permit(:board)
    end

end

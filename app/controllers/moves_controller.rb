class MovesController < ApplicationController

  def index
    @moves = Move.where(student_id: params[:student_id])
    @puzzles = Puzzle.all
    render json: {moves: @moves, puzzles: @puzzles}
  end

  def create
    @move = current_user.Move.new(move_params)
    if params[:moves].empty?
      @move.destroy
    else
      @move.save
    end
    render json: @move
  end

  private

  def move_params
    require(:move).permit(:moves)
  end
end

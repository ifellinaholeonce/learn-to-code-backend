class MovesController < ApplicationController

  def index
    @moves = Move.where(student_id: params[:student_id])
    @puzzles = Puzzle.all
    render json: {moves: @moves, puzzles: @puzzles}
  end

  def create
    @move = current_user.moves.new(completed: params[:completed], moves: params[:moves], puzzle_id: params[:puzzle_id])
    if params[:moves].empty?
      @move.destroy
      render plain: "Invalid move", status: 400
    else
      @move.save
      render json: @move, status: 201
    end
  end

  private

  def move_params
    params.require(:move).permit(:moves, :completed, :puzzle_id)
  end
end

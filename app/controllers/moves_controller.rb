class MovesController < ApplicationController

  def index
    @moves = Move.where(student_id: params[:id])
  end

  def create
    @move = Move.new(move_params)
  end

  def update

  end

  def destroy

  end

  private

  def move_params
    require(:move).permit(:moves)
  end
end

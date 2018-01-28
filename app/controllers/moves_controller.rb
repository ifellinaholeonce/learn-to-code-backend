class MovesController < ApplicationController

  def index
    @moves = Move.where(student_id: params[:student_id])
    render json: @moves
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

  def update
    @move = Move.find_by(params[:id])
    @move.update(params[:move])
  end

  def destroy
    @move = Move.find_by(params[:id])
    @move.destroy
  end

  private

  def move_params
    require(:move).permit(:moves)
  end
end

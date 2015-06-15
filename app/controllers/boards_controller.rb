class BoardsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]

  def index
    @boards = Board.all
  end


  def show
    set_board

  end


  def new
    @board = Board.new
  end


  def edit
    set_board
  end


  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to @board, notice: 'Board was successfully created.'
    else
      render :new
    end
  end


  def update
    set_board
    if @board.update(board_params)
      redirect_to @board, notice: 'Board was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    set_board
    @board.destroy
    redirect_to boards_url, notice: 'Board was successfully destroyed.'
  end

  private
  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:category)
  end
end

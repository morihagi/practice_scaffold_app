class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  # GET /boards
  def index
    @boards = Board.all
  end

  # GET /boards/1
  def show
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
  end

    # board /boards
    def create
      @board = Board.new(board_params)
  
      if @board.save
        redirect_to @board, notice: '投稿成功'
      else
        render :new
      end
    end
  
    # PATCH/PUT /boards/1
    def update
      if @board.update(board_params)
        redirect_to @board, notice: '投稿更新'
      else
        render :edit
      end
    end
  
    # DELETE /boards/1
    def destroy
      @board.destroy
      redirect_to boards_url, notice: '投稿削除'
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_board
        @board = Board.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def board_params
        params.require(:board).permit(:title, :body)
      end
end

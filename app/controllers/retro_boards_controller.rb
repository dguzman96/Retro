class RetroBoardsController < ApplicationController
  before_action :set_retro_board, only: %i[ show edit update destroy ]

  # GET /retro_boards or /retro_boards.json
  def index
    @retro_boards = RetroBoard.all
  end

  # GET /retro_boards/1 or /retro_boards/1.json
  def show
  end

  # GET /retro_boards/new
  def new
    @retro_board = RetroBoard.new
  end

  # GET /retro_boards/1/edit
  def edit
  end

  # POST /retro_boards or /retro_boards.json
  def create
    @retro_board = RetroBoard.new(retro_board_params)

    respond_to do |format|
      if @retro_board.save
        format.html { redirect_to @retro_board, notice: "Retro board was successfully created." }
        format.json { render :show, status: :created, location: @retro_board }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @retro_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /retro_boards/1 or /retro_boards/1.json
  def update
    respond_to do |format|
      if @retro_board.update(retro_board_params)
        format.html { redirect_to @retro_board, notice: "Retro board was successfully updated." }
        format.json { render :show, status: :ok, location: @retro_board }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @retro_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /retro_boards/1 or /retro_boards/1.json
  def destroy
    @retro_board.destroy
    respond_to do |format|
      format.html { redirect_to retro_boards_url, notice: "Retro board was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def destroy
    @retro_item = @retro_board.retro_items.find(params[:id])
    if @retro_item.destroy
      flash[:success] = "Retro Board item was deleted."
    else
      flash[:error] = "Retro Board item could not be deleted."
    end
    redirect_to @retro_board
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_retro_board
      @retro_board = RetroBoard.find(params[:id])
    end

    # Only allow a board of trusted parameters through.
    def retro_board_params
      params.require(:retro_board).permit(:title, :description)
    end
end

class RetroListsController < ApplicationController
  before_action :set_retro_board, only: %i[ show edit update destroy ]

  # GET /retro_boards or /retro_boards.json
  def index
    @retro_boards = RetroList.all
  end

  # GET /retro_boards/1 or /retro_boards/1.json
  def show
  end

  # GET /retro_boards/new
  def new
    @retro_board = RetroList.new
  end

  # GET /retro_boards/1/edit
  def edit
  end

  # POST /retro_boards or /retro_boards.json
  def create
    @retro_board = RetroList.new(retro_board_params)

    respond_to do |format|
      if @retro_board.save
        format.html { redirect_to @retro_board, notice: "Retro Board item was successfully created." }
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
        format.html { redirect_to @retro_board, notice: "Retro Board item was successfully updated." }
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
      format.html { redirect_to root_url, notice: 'Retro Board item was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_retro_board
      @retro_board = RetroList.find(params[:id])
    end

    # Only allow a board of trusted parameters through.
    def retro_board_params
      params.require(:retro_board).permit(:title, :description)
    end
end

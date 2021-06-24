class RetroItemsController < ApplicationController
  before_action :set_retro_board
  before_action :set_retro_item, except: [:create]


  def create
    @retro_item = @retro_board.retro_items.create(retro_item_params)
    redirect_to @retro_board
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

  def complete
    @retro_item.update_attribute(:completed_at, Time.now)
    redirect_to @retro_board, notice: "Retro Board item completed"
  end

  def set_retro_item
    @retro_item = @retro_board.retro_items.find(params[:id])
  end

  private

  def set_retro_board
    @retro_board = RetroList.find(params[:retro_board_id])
  end

  def set_retro_item
   @retro_item = @retro_board.retro_items.find(params[:id])
  end

  def retro_item_params
    params[:retro_item].permit(:content)
  end
end

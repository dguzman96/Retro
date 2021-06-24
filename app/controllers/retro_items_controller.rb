class RetroItemsController < ApplicationController
   before_action :set_retro_board

   def create
     @retro_item = @retro_board.retro_items.create(retro_item_params)
     redirect_to @retro_board
   end

   private
   def set_retro_board
     @retro_board = RetroBoard.find(params[:retro_board_id])
   end

   def retro_item_params
     params[:retro_item].permit(:content)
   end
end

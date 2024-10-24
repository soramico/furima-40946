class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item).permit(:image,:product_name, :product_description, :category_id, :condition_id, :contribution_id, :prefecture_id, :day_id, :price).merge(user_id: current_user.id)
  end

end

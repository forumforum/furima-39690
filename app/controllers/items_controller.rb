class ItemsController < ApplicationController
<<<<<<< Updated upstream
  before_action :authenticate_user!, except: [:index, :show]

=======
  
>>>>>>> Stashed changes
  def index
  end

  def new
<<<<<<< Updated upstream
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :shipping_cost_id, :prefecture_id,
                                 :delivery_time_id, :price).merge(user_id: current_user.id)
=======
    @item =Item.new
>>>>>>> Stashed changes
  end

end


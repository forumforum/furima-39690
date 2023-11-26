class ItemsController < ApplicationController
  # ログインしていないユーザーはログインページに促す
  before_action :authenticate_user!, except: [:index, :show]

  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item= Item.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end

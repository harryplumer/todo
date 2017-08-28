class ItemsController < ApplicationController
  def index
    @items = Item.all 
    #render :index
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to item_path(item)
    else
      render :new
    end
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to items_path
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def home
    @items = Item.all 
  end

  def completed 
    @items = Item.where(completed: true)
  end

  private
    def item_params
      params.require(:item).permit(:name, :completed, :high_priority, :description)
    end      
end

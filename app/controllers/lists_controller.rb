class ListsController < ApplicationController
  before_action :set_list, only: [:create_task, :show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  def index
    @lists = List.find(current_browser_lists).last(5)
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      current_browser_lists << @list.id
      redirect_to "/lists/#{@list.slug}", notice: 'List was successfully created.'
    else
      redirect_to root_path, notice: 'List could not be created'
    end
  end

  def show
    @task = Task.new
  end

  def update
    if @list.update(list_params)
      redirect_to "/lists/#{@list.slug}", notice: 'List was successfully updated.'
    else
      render :show
    end
  end

  private

  def set_list
    @list = List.find_by(slug: params[:list_id] || params[:id])
  end

  def list_params
    params.require(:list).permit(:title)
  end
end

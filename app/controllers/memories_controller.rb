class MemoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :owned_post, only: [:edit, :update, :destroy]
  before_action :set_memory, only: [:show, :edit, :update, :destroy]

  def index
    @memories = Memory.all
  end
  
  def show
  end

  def new
    @memory = current_user.memories.build
  end

  def create
    @memory = current_user.memories.build(memory_params)

    if @memory.save
      flash[:success] = "Your memory has been created!"
      redirect_to memories_path
    else
      flash.now[:alert] = "Your new memory couldn't be created! Please check the form."
      render :new
    end
  end

  def edit
  end

  def update
    if @memory.update(memory_params)
      flash[:success] = "Your memory has been updated!"
      redirect_to(memory_path(params[:id]))
    else
      flash.now[:alert] = "Update failed. Please check the form."
      render :edit
    end
  end

  def destroy
    if @memory.destroy
      flash[:success] = "Your memory has been destoryed!"
      redirect_to memories_path
    end
  end

  private

  def memory_params
   params.require(:memory).permit(:image, :caption)
  end

  def set_memory
    @memory = Memory.find(params[:id])
  end

  def owned_post
    unless current_user == @memory.user
      flash[:alert] = "That memory doesn't belong to you!"
      redirect_to root_path
    end
  end
end

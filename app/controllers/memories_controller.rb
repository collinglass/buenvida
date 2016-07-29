class MemoriesController < ApplicationController
  def index
    @memories = Memory.all
  end
  
  def show
    @memory = Memory.find(params[:id])
  end

  def new
    @memory = Memory.new
  end

  def create
    @memory = Memory.create(memory_params)
    redirect_to memories_path
  end

  def edit
    @memory = Memory.find(params[:id])
  end

  def update
    @memory = Memory.find(params[:id])
    @memory.update(memory_params)
    redirect_to(memory_path(params[:id]))
  end

  def destroy
    @memory = Memory.find(params[:id])
    @memory.destroy
    redirect_to memories_path
  end

  private

  def memory_params
   params.require(:memory).permit(:image, :caption)
  end
end

class DogsController < ApplicationController

  def index
    @dogs = Dog.all
    render :index
  end

  def show
    @dog = Dog.find(params[:id])
    render :show
  end

  def new
    @dog = Dog.new(name: "", color: "", sex: "", birth_date: "", description: "Tell us about your dog")
    render :new
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      redirect_to dog_url(@dog)
    else
      redirect_to new_dog_url
    end
  end

  def edit
    @dog = Dog.find(params[:id])
    render :edit
  end

  def update
    @dog = Dog.find(params[:id])
    if @dog.update(dog_params)
      redirect_to dog_url(@dog)
    else
      render :edit
    end
  end

  private
  def dog_params
    params.require(:dog).permit(:name, :color, :birth_date, :sex, :description)
  end
end

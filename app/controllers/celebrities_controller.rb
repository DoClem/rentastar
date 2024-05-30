class CelebritiesController < ApplicationController
  before_action :set_celebrity, only: [:show, :update, :destroy]

  def new
    @celebrity = Celebrity.new
  end

  def create
    @celebrity = Celebrity.new(celebrity_params)
    @celebrity.user = current_user
    if @celebrity.save
      redirect_to celebrity_path(@celebrity), notice: 'Celebrity was successfully created.'
    else
      render :new
    end
  end

  def index
    @celebrities = Celebrity.all
  end

  def show
    @booking = Booking.new
  end

  def update
    if @celebrity.update(celebrity_params)
      redirect_to celebrity_path(@celebrity), notice: 'Celebrity was successfully updated.'
    else
      render :edit
    end
  end

  def search
    query = params[:query]
    @celebrities = Celebrity.where('first_name LIKE ? OR last_name LIKE ?', "%#{query}%", "%#{query}%")
    render :search
  end

  def destroy
    @celebrity.destroy!
    redirect_to celebrities_path, status: :see_other, notice: 'Celebrity was successfully deleted.'
  end

  private

  def set_celebrity
    @celebrity = Celebrity.find(params[:id])
  end

  def celebrity_params
    params.require(:celebrity).permit(:first_name, :last_name, :age, :address, :price)
  end
end

class CelebritiesController < ApplicationController
  def new
    @celebrity = Celebrity.new
  end

  def create
    @celebrity = Celebrity.new(celebrity_params)
    @celebrity.user = current_user
    @celebrity.save
    redirect_to celebrity_path(@celebrity)
  end

  def index
    @ruser = User.all
  end

  private

  def celebrity_params
    params.require(:celebrity).permit(:first_name, :last_name, :age, :address, :category, :price)
  end
end

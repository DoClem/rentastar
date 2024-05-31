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
    @celebrity = Celebrity.new
  end

  def show
    @booking  = Booking.new
    @bookings = @celebrity.bookings
    @bookings_dates = @bookings.map do |booking|
      {
        from: booking.start_date,
        to:   booking.end_date
      }
    end
  end

  def update
    if @celebrity.update(celebrity_params)
      redirect_to celebrity_path(@celebrity), notice: 'Celebrity was successfully updated.'
    else
      render :edit
    end
  end

  def search
    query = params[:query].downcase
    query_words = query.split

    conditions = Array.new(query_words.size, 'LOWER(first_name) LIKE ? OR LOWER(last_name) LIKE ? OR LOWER(CONCAT(first_name, last_name)) LIKE ? OR LOWER(CONCAT(first_name, last_name)) LIKE ?').join(' OR ')

    values = query_words.flat_map do |word|
      ["%#{word}%", "%#{word}%", "%#{word}%", "%#{word}%"]
    end

    @celebrities = Celebrity.where(conditions, *values)
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

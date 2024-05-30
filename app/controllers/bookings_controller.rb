class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_celebrity, only: [:create]

  def index
    @bookings = Booking.all
  end

  def show
    # Assurez-vous que @booking.celebrity n'est pas nil
    if @booking.celebrity.nil?
      redirect_to bookings_path, alert: "Celebrity not found for this booking."
    end
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.celebrity = @celebrity
    @booking.user = current_user

    if @booking.save
      redirect_to bookings_path(@booking), notice: "Booking success!"
    else
      render 'celebrities/show', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to bookings_path(@bookings), notice: "Booking updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, notice: "Booking was successfully deleted."
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_celebrity
    @celebrity = Celebrity.find(params[:celebrity_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :celebrity_id, :user_id)
  end
end

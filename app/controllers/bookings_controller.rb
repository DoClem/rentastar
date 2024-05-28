class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    @celebrity = Celebrity.find(params[:celebrity_id])
    @booking.celebrity = @celebrity
    @booking.user = current_user
    if @booking.save
      redirect_to celebrities_path, notice: "Booking sucess !"
    else
      render 'celebrities/show', status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to booking_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :celebrity_id, :user_id)
  end
end

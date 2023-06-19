class Api::V1::BookingsController < ApplicationController
    before_action :authenticate_user!
    # GET /api/v1/bookings
    def index
      @bookings = Booking.all
      render json: @bookings
    end
  
    # GET /api/v1/bookings/:id
    def show
      @booking = Booking.find(params[:id])
      render json: @booking
    end
  
    # POST /api/v1/bookings
    def create
        @booking = current_user.bookings.build(booking_params)
      if @booking.save
        render json: @booking, status: :created
      else
        render json: @booking.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/v1/bookings/:id
    def update
        @booking = current_user.bookings.find(params[:id])
      if @booking.update(booking_params)
        render json: @booking
      else
        render json: @booking.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/v1/bookings/:id
    def destroy
    @booking = current_user.bookings.find(params[:id])
      @booking.destroy
      head :no_content
    end
  
    private
  
    def booking_params
      params.require(:booking).permit(:customer_id, :service_id, :date, :time)
    end
  end
  
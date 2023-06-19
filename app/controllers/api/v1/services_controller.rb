class Api::V1::ServicesController < ApplicationController
    before_action :authenticate_user!
    # GET /api/v1/services
    def index
      @services = Service.all
      render json: @services
    end
  
    # GET /api/v1/services/:id
    def show
      @service = Service.find(params[:id])
      render json: @service
    end
  
    # POST /api/v1/services
    def create
        @service = current_user.services.build(service_params)
      if @service.save
        render json: @service, status: :created
      else
        render json: @service.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/v1/services/:id
    def update
        @service = current_user.services.find(params[:id])
      if @service.update(service_params)
        render json: @service
      else
        render json: @service.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/v1/services/:id
    def destroy
    @service = current_user.services.find(params[:id])
      @service.destroy
      head :no_content
    end
  
    private
  
    def service_params
      params.require(:service).permit(:name, :description, :price, :duration)
    end
  end
  

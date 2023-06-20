class Api::V1::CustomersController < ApplicationController
    before_action :authenticate_user!
    # GET /api/v1/customers
    def index
        @customer = current_user.customers.build(customer_params)
        render json: @companies, status: :ok
    end
  
    # GET /api/v1/customers/:id
    def show
      @customer = Customer.find(params[:id])
      render json: @customer
    end
  
    # POST /api/v1/customers
    def create
      @customer = current_user.customers.new(customer_params)
      if @customer.save
        render json: @customer, status: :created
      else
        render json: @customer.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/v1/customers/:id
    def update
        @customer = current_user.customers.find(params[:id])
      if @customer.update(customer_params)
        render json: @customer
      else
        render json: @customer.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/v1/customers/:id
    def destroy
        @customer = current_user.customers.find(params[:id])
        @customer.destroy
        head :no_content
    end
  
    private
  
    def customer_params
      params.require(:customer).permit(:name, :email, :phone)
    end
  end
  
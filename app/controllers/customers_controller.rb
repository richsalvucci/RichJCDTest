class CustomersController < ApplicationController
before_filter :find_business
before_filter :find_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.all
  end

  def new
    @customer = @business.customer.new
  end

  def create
    @customer = @business.customers.create customer_params
    if @customer.save
      flash[:notice] = "Thank You"
      redirect_to business_customers_path
    else
      flash[:error] = "Please enter a name and phone number."
      render :new
    end
  end

  def update
    @customer.update_attributes customer_params
    redirect_to business_customers_path
  end

  def edit 
  end

  def show
    
  end

  def destroy
    @customer.delete
    redirect_to business_customers_path
  end
private
  def find_business
    @business = Business.find params[:business_id]
  end

  def find_customer
    @customer = Customer.find params[:id]
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email)
  end
end


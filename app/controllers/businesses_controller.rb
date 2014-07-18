class BusinessesController < ApplicationController
before_filter :find_business, only: [:show, :edit, :update, :destroy]

  def index
    @businesses = Business.all
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.create business_params
    if @business.save
      flash[:notice] = "Thank You"
      redirect_to businesses_path
    else
      flash[:error] = "Please enter a name and phone number."
      render :new
    end
  end

  def update
    @business.update_attributes business_params
    redirect_to businesses_path
  end

  def edit 
  end

  def show
    @customer = @business.customers
  end

  def destroy
    @business.delete
    redirect_to businesses_path
  end
private
  def find_business
    @business = Business.find params[:id]
  end

  def business_params
    params.require(:business).permit(:name, :phone_number)
  end
end

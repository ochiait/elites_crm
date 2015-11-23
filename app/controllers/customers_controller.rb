class CustomersController < ApplicationController
  def index
  end

  def new
    @customer = Customer.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to customer_url(@comment.customer_id)
    else
      redirect_to customer_url(@comment.customer_id)
    end
  end

  def edit
  end

  def update
  end

  def show
    @customer = Customer.find(params[:id])
    @comment = Comment.new # これをform_forで使う
  end

  def destroy
  end
  private

  def customer_params
    params.require(:customer).permit(
      :family_name,
      :given_name,
      :email
      )
  end
   def comment_params
    params.require(:comment).permit(:body, :customer_id)
  end
end

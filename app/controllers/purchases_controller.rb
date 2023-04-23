class PurchasesController < ApplicationController
  before_action :set_purchase, only: %i[ show edit update destroy ]


  # GET /purchases/new
  def new
    @purchase = Purchase.new
    @categories = Category.all
  end

  # POST /purchases or /purchases.json
  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.author = current_user
    @category = Category.find(params[:purchase][:category_id])
    @purchase.categories << @category
     if @purchase.save
        redirect_to category_url(params[:purchase][:category_id]), notice: "Transaction was successfully created."
     else
        render :new, status: :unprocessable_entity
     end
  end

  private

    # Only allow a list of trusted parameters through.
    def purchase_params
      params.require(:purchase).permit(:name, :amount)
    end
end

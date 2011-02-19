class PublicController < ApplicationController
  
  layout 'public'
  
  def index
    #intro text
  end

  def show
    @products = Product.order("products.id ASC")
    redirect_to(:action => 'index') unless @products
  end
  
  def catshow
    @categories = Category.order("categories.position ASC")
    redirect_to(:action => 'index') unless @categories
  end

end

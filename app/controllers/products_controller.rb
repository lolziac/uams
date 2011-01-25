class ProductsController < ApplicationController
	layout 'admin'
	
  def index
    list
    render('list')
  end
  
  def list
    @products = Product.order("products.brand ASC")
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
  end
  
  def create
    # Instantiate a new object using form parameters
	@product = Product.new(params[:product])
    # Save the object
	if @product.save
      # If save succeeds, redirect to the list action
      flash[:notice] = "Product created."
      redirect_to(:action => 'list')
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    # Find object using form parameters
	@product = Product.find(params[:id])
    # Update the object
	if @product.update_attributes(params[:product])
      # If update succeeds, redirect to the list action
      flash[:notice] = "Product updated."
      redirect_to(:action => 'show', :id => @product.id)
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end
  
  def delete
    @product = Product.find(params[:id])
  end
  
  def destroy
    Product.find(params[:id]).destroy
    flash[:notice] = "Product destroyed."
    redirect_to(:action => 'list')
  end
	
end

class CategoriesController < ApplicationController
	
	layout 'admin'

	def index
		list
		render('list')
	end

	def list
		@categories = Category.order("categories.position ASC")
	end

	def show
		@category = Category.find(params[:id])
	end
	
	def new
		@category = Category.new(:name => 'default')
		@category_count = Category.count + 1
	end
	
	def create
		# Instantiate a new object using form parameters
		@category = Category.new(params[:category])
		# Save the object
		if @category.save
		# If save succeeds, redirect to the list action
		  flash[:notice] = "Category created successfully."
		  redirect_to(:action => 'list')
		else
		# If save fails, redisplay the form so the user can  fix problems
		  @category_count = Category.count + 1
		  render('new')
		end
	end
	
	def edit
		@category = Category.find(params[:id])
		@category_count = Category.count
	end
	
	def update
		# Find object using form parameters
		@category = Category.find(params[:id])
		# Update the object
		if @category.update_attributes(params[:category])
		# If update succeeds, redirect to the show action
		  flash[:notice] = "Category updated successfully."
		  redirect_to(:action => 'show', :id => @category.id)
		else
		# If update fails, redisplay the form so the user can  fix problems
		  @category_count = Category.count
		  render('edit')
		end
	end
	
	def delete
		@category = Category.find(params[:id])
	end
	
	def destroy
		Category.find(params[:id]).destroy
		flash[:notice] = "Category Deleted."
		redirect_to(:action => 'list')
	end
	
end

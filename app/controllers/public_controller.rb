class PublicController < ApplicationController
  
  layout 'public'
  
  def index
    confirm_logged_in
  end

  def show
    @products = Product.order("products.id ASC")
    redirect_to(:action => 'index') unless @products
  end
  
  def confirm_logged_in
        unless session[:user_id]
            flash[:notice] = "Please log in."
            redirect_to(:controller => 'access', :action => 'login')
        return false #halts the before_filter
        else
        return true
        end
  end
    
  def catshow
    @categories = Category.order("categories.position ASC")
    redirect_to(:action => 'index') unless @categories
  end

end

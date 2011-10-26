class ProductsController < ApplicationController

    layout 'admin'

    before_filter :confirm_logged_in
    before_filter :find_category
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

    def checkin
        @product = Product.find(params[:id])
        render :layout => false
    end

    def assign
        # Find object using form parameters
        date = Date.parse "#{params[:product]["date_in(3i)"]}-#{params[:product]["date_in(2i)"]}-#{params[:product]["date_in(1i)"]}"
        info_in = params[:product][:info]
        @product = Product.find(params[:id])
        # Update the object
        if @product.update_attributes(:employee_id => params[:product][:employee_id], :status => 'In Use')
            # If update succeeds, add info to track and redirect to the list action
            @track = Track.new(:product_id => params[:id], :employee_id => params[:product][:employee_id], :date_in => date, :status => 'In Use', :info_in => info_in)
            @track.save
            flash[:notice] = "Asset Assigned."
            redirect_to(:action => 'list')
        else
        # If save fails, redisplay the form so user can fix problems
            flash[:notice] = "Error: Asset not assigned."
            render('list')
        end
    end

    def checkout
        @product = Product.find(params[:id])
        render :layout => false
    end

    def deassign
        # Find object using form parameters
        date = Date.parse "#{params[:product]["date_out(3i)"]}-#{params[:product]["date_out(2i)"]}-#{params[:product]["date_out(1i)"]}"
        info_out = params[:product][:info]
        @product = Product.find(params[:id])
        # Update the object
        if @product.update_attributes(:employee_id => params[:product][:employee_id], :status => 'Available')
            # If update succeeds, add info to track and redirect to the list action
            if @track = Track.where(:product_id => params[:id], :status => 'In Use').first
                @track.update_attributes(:employee_id => params[:product][:employee_id], :date_out => date, :info_out => info_out, :status => 'Available')
                flash[:notice] = "Asset Deassigned."
                redirect_to(:action => 'list')
            else
                flash[:notice] = "There is no Asset to be Deassigned."
                redirect_to(:action => 'list')
            end
        else
        # If save fails, redisplay the form so user can fix problems
            flash[:notice] = "Error: Asset coulnt be deassigned."
            render('list')
        end
    end

    def generate_report
      table = Product.report_table(:all, 
              :only => %w[category_id brand name serialnr modelnr status], 
              :group => "brand, name, status")
              
              grouping = Grouping(table, :by => "brand")
              
              send_data grouping.to_pdf,
                :type => "aplication/pdf",
                :disposition => "inline",
                :filename => "report.pdf"
         
    end
  
    private

    def find_category
        if params[:category_id]
            @category = Category.find_by_id(params[:category_id])
        end
    end

end

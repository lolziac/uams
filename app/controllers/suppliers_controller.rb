class SuppliersController < ApplicationController

    layout 'admin'

    before_filter :confirm_logged_in
    
    def index
        list
        render('list')
    end

    def list
        @suppliers = Supplier.order("suppliers.company_name ASC")
    end

    def show
        @supplier = Supplier.find(params[:id])
    end

    def new
        @supplier = Supplier.new
    end

    def create
        # Instantiate a new object using form parameters
        @supplier = Supplier.new(params[:supplier])
        # Save the object
        if @supplier.save
            # If save succeeds, redirect to the list action
            flash[:notice] = "Supplier created."
            redirect_to(:action => 'list')
        else
        # If save fails, redisplay the form so user can fix problems
            render('new')
        end
    end
    
    def edit
        @supplier = Supplier.find(params[:id])
        @supplier_count = Supplier.count
    end
    
    def update
        # Find object using form parameters
        @supplier = Supplier.find(params[:id])
        # Update the object
        if @supplier.update_attributes(params[:supplier])
            # If update succeeds, redirect to the show action
            flash[:notice] = "Supplier updated successfully."
            redirect_to(:action => 'show', :id => @supplier.id)
        else
        # If update fails, redisplay the form so the user can  fix problems
            @supplier_count = Supplier.count
            render('edit')
        end
    end

    def delete
        @supplier = Supplier.find(params[:id])
    end

    def destroy
        Supplier.find(params[:id]).destroy
        flash[:notice] = "Supplier Deleted."
        redirect_to(:action => 'list')
    end
end
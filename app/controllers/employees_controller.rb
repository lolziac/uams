class EmployeesController < ApplicationController

    layout 'admin'

    before_filter :confirm_logged_in
    def index
        list
        render('list')
    end

    def list
        @employees = Employee.order("employees.first_name ASC")
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def new
        @employee = Employee.new
    end

    def create
        # Instantiate a new object using form parameters
        @employee = Employee.new(params[:employee])
        # Save the object
        if @employee.save
            # If save succeeds, redirect to the list action
            flash[:notice] = "Employee created."
            redirect_to(:action => 'list')
        else
        # If save fails, redisplay the form so user can fix problems
            render('new')
        end
    end
    
    def edit
        @employee = Employee.find(params[:id])
        @employee_count = Employee.count
    end
    
    def update
        # Find object using form parameters
        @employee = Employee.find(params[:id])
        # Update the object
        if @employee.update_attributes(params[:employee])
            # If update succeeds, redirect to the show action
            flash[:notice] = "Employee updated successfully."
            redirect_to(:action => 'show', :id => @employee.id)
        else
        # If update fails, redisplay the form so the user can  fix problems
            @employee_count = Employee.count
            render('edit')
        end
    end

    def delete
        @employee = Employee.find(params[:id])
    end

    def destroy
        Employee.find(params[:id]).destroy
        flash[:notice] = "Employee Deleted."
        redirect_to(:action => 'list')
    end
end

class WorkersController < ApplicationController

	layout 'admin'
	
	before_filter :confirm_logged_in
	
end

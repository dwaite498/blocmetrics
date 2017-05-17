class RegisteredApplicationsController < ApplicationController
    def index
        @application = Application.all
    end
    
    def new
        @application = Application.new
    end
    
    def create
        @application = Application.new
        @application.url = params[:application][:url]
        @application.url = params[:application][:title]
        @application.user = current_user
        if @application.save
            redirect_to registered_application_path(@application), notice: "App added successfully!"
        else
            flash.now[:alert] = "There was an error adding the app, please try again."
            render :new
        end
    end
    
    def show
       @application = Application.find(params[:id]) 
    end
end

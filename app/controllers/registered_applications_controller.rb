class RegisteredApplicationsController < ApplicationController
    def index
        @applications = Application.all
    end
    
    def new
        @application = Application.new
    end
    
    def create
        @application = Application.new
        @application.url = params[:application][:url]
        @application.title = params[:application][:title]
        @application.title = params[:events][:event]
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
       @events = @application.events.group_by(&:title)
    end
    
    def destroy
       @application = Application.find(params[:id])
       if @application.destroy
           redirect_to registered_applications_path
       else
          render :show 
       end
    end
end

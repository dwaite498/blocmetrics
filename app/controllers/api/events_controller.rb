class API::EventsController < ApplicationController
   skip_before_action :verify_authenticity_token
   skip_before_filter :authenticate_user!

   
   before_filter :set_access_control_headers
   
   def set_access_control_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, Options'
      headers['Access-Control-Allow-Headers'] = 'Content-Type'
   end
   
   def create
       registered_application = Application.find_by(url: request.env['HTTP_ORIGIN'])
       if registered_application == nil
           render json: "Unregistered Application", status: :unprocessable_entity
       else
           puts event_params
           
            @event = registered_application.events.build(event_params)
            if @event.save
                render json: @event, status: :created
            else 
                render json: {errors: @event.errors}, status: :unprocessable_entity
            end
       end
   end
   
   def preflight
      head 200 
   end
   
   private
   
   def event_params
      params.require(:event).permit(:title)
   end
end


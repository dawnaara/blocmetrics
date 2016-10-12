 class API::EventsController < ApplicationController
   skip_before_action :verify_authenticity_token
   before_filter :set_access_control_headers

   def set_access_control_headers
     headers['Access-Control-Allow-Origin'] = '*'
     headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
     headers['Access-Control-Allow-Headers'] = 'Content-Type'
   end
 
   def create
     registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])

     Rails.logger ">>>>> request: #{request.to_h.inspect}"
     Rails.logger ">>>>> request body: #{request.body.inspect}"
     
     unless registered_application
     	render json: "Unregistered application", status: :unprocessable_entity
     end

     # create event for registered application based on the params sent

     # @event = Event.new(event_params)
     # @event.registered_application = registered_application
     @event = registered_application.events.new(event_params)

     if @event.save
     	render json: @event, status: :created
     else
     	render json: {errors: @event.errors}, status: :unprocessable_entity
     end

    def preflight
    	head 200
  	end
   end

   private

   def event_params
     params.require(:event).permit(:name)
   end
 end
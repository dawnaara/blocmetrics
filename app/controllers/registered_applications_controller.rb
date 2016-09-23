class RegisteredApplicationsController < ApplicationController
  before_action :set_registered_application
  def index
    @users = User.all
    @registered_application = RegisteredApplication.all
  end  

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = current_user.registered_applications.new(registered_application_params)
  end

  def edit
  end

  def update
  end

  def destroy
    @registered_application.destroy
  end

  private
    def set_registered_application
      @registered_application = RegisteredApplication.find(params[:id])
    end

    def registered_application_params
      params.require(:registered_application).permit(:name, :url)
    end

end

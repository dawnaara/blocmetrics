class RegisteredApplicationsController < ApplicationController
  before_action :set_registered_application, except: [:index, :new, :create]
  def index
    @registered_applications = RegisteredApplication.all
  end  

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = current_user.registered_applications.new(registered_application_params)

    if @registered_application.save
      flash[:notice] = "Saved"
      redirect_to registered_applications_path
    else
      flash[:warning] = "not saved"
      render :new
    end
  end

  def edit
  end

  def update
    if @registered_application.update_attributes(registered_application_params)
      # flash good
      redirect_to registered_applications_path
    else 
      # flash bad
      render :edit
    end
  end

  def destroy
    if @registered_application.destroy
      flash[:notice] = "Application was destroyed successfully."
      redirect_to registered_applications_path

    else
      flash[:alert] = "There was an error deleting your application."
      redirect_to registered_applications_path
    end
  end

  def show
     @events = @registered_application.events.group_by(&:name)
  end

  private
    def set_registered_application
      @registered_application = RegisteredApplication.find(params[:id])
    end

    def registered_application_params
      params.require(:registered_application).permit(:name, :url)
    end
end

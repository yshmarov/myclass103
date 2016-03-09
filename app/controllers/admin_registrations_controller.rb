class AdminRegistrationsController < Devise::RegistrationsController

  def destroy
    redirect_to root_path, notice: 'Suicide impossible!'
  end    

  def new
    redirect_to root_path
  end

  def create
    redirect_to root_path
  end

end

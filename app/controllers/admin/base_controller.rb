class Admin::BaseController < ApplicationController
  before_action :check_admin

  private

  def check_admin
    redirect_to root_path, alert: "Necessite des privilages d'adminitsrateur" unless current_user.admin?
  end
end

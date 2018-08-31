class HomeController < ApplicationController
  def index
  end

  def get_fullpage
    respond_to do |format|
      format.xml { render :json => Rails.application.credentials.fullpage_license.to_s }
    end
  end
end

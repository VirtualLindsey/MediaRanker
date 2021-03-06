class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404


  def index
    @session = session
  end


  def render_404
    render :file => "#{Rails.root}/public/404.html", :status => 404
  end

end

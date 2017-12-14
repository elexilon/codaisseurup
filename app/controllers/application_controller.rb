class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @categories = Category.all
  end

end

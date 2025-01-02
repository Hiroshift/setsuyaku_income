class ApplicationController < ActionController::Base
  before_action :basic_auth
  def hello
    render html: "Welcome to Rails!"
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER_SETSUYAKU"] && password == ENV["BASIC_AUTH_PASSWORD_SETSUYAKU"]
    end
  end
end

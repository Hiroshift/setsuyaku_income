class ApplicationController < ActionController::Base
  def hello
    render html: "Welcome to Rails!"
  end
end

require "sinatra"
require "gschool_database_connection"
require "rack-flash"

class App < Sinatra::Application
  def initialize
    super
    @database_connection = DatabaseConnection.establish(ENV["RACK_ENV"])
  end

  get "/" do
    erb :root
  end

  get "/register" do
    erb :register
  end

  post "/register" do
    @database_connection.sql "(INSERT into users (username, password) params[:username]
  values ('#{params[:username]}','#{params[:password]}')"
    flash[:notice] = "Thank you for registering!"
    redirect "/"
  end
end


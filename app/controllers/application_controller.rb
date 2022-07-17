class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Check if user exists
  get '/users/:email' do
    user = User.find_by(email: params[:email])
    user.to_json
  end

  # Verify user password
  get '/user/:email/:pass' do
    user = User.find_by(email: params[:email])
    if user.password === params[:pass]
      user.name.to_json
    else
      status 403
      body "Incorrect password.".to_json
    end
  end
  
  # Add new user
  post '/signup' do
    user = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    user.to_json()
  end
end

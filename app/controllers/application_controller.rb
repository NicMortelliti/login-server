class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Check if user exists
  get '/users/:email' do
    user = User.find_by(email: params[:email])
    user.to_json
  end
  
  # Add new user
  post '/signup' do
    user = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    task.to_json(user)
  end
end

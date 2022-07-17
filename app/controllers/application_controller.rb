class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

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

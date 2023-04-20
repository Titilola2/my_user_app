require 'json'
require 'sinatra'
require_relative 'my_user_model.rb'

set :bind, '0.0.0.0'
set :port, 8080
enable :sessions

get '/' do
   @users=User.all()
   erb :index
end

get '/users' do
    status 200
    User.all.map{|col| col.slice("firstname", "lastname", "age", "email")}.to_json
end

post '/sign_in' do
    verify_user=User.authenticate(params[:password],params[:email])
    if !verify_user.empty?
        status 200
        session[:user_id] = verify_user[0]["id"]
    else
        status 401
    end 
    verify_user[0].to_json
end

post '/users' do
    if params[:firstname] != nil
        create_user = User.create(params)
        new_user = User.find(create_user.id)
        user={:firstname=>new_user.firstname,:lastname=>new_user.lastname,:age=>new_user.age,:password=>new_user.password,:email=>new_user.email}.to_json
    else 
        check_user=User.authenticate(params[:password],params[:email])
        if !check_user[0].empty?
            status 200
            session[:user_id] = check_user[0]["id"]
        else
            status 401
        end 
        check_user[0].to_json
    end 
end

put '/users' do
    User.update(session[:user_id] , 'password', params[:password])
    user=User.find(session[:user_id])
    status 200
    user_info={:firstname=>user.firstname,:lastname=>user.lastname,:age=>user.age,:password=>user.password,:email=>user.email}.to_json
end

delete '/sign_out' do
    session[:user_id] = nil if session[:user_id]
    status 204
end

# To delete an active user uncomment line 61, gandalf couln't permit deleting a user from the db
delete '/users' do
    # User.destroy(session[:user_id]) if !session[:user_id].empty?
    status 204
end

require 'sinatra'

set :port, 4567
set :static, true
set :public_folder, 'static'
set :views, 'views'

get '/' do
  return 'Hello world!'
end

get '/hello' do
  erb :hello_form
end

post '/hello' do
  greeting = params.fetch(:greeting, 'Hi There')
  name = params.fetch('name', 'Nobody')

  erb :index, locals: { 'greeting' => greeting, 'name' => name }
end
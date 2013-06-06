require 'sinatra'

get '/' do
  sleep 2 
  "Root Cached"
end

get '/cache' do
  sleep 2
  "Other Cached"
end

get '/nocache' do
  sleep 5
  "No Cached"
end

get '/nocacheff' do
  sleep 5
  "No cached from fetch"
end

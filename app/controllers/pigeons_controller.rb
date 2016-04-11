class PigeonsController < ApplicationController
  
  get '/pigeons' do
    erb :'pigeons/index'
  end
  
  post '/pigeons' do
    name = params[:name]
    color = params[:color]
    gender = params[:gender]
    lives = params[:lives]
    Pigeon.create(name: name, color: color, gender: gender, lives: lives)
    redirect '/pigeons'
  end
  
  get '/pigeons/new' do
    erb :'pigeons/new'
  end
  
  get '/pigeons/:id' do
    @pigeon = Pigeon.find_by_id(params[:id])
    erb :'pigeons/show'
  end
  
  get '/pigeons/:id/edit' do
    @pigeon = Pigeon.find_by_id(params[:id])
    erb :'/pigeons/edit'
  end
  
  patch '/pigeons/:id' do
    @pigeon = Pigeon.find_by_id(params[:id])
    @pigeon.name = params[:name]
    @pigeon.color = params[:color]
    @pigeon.gender = params[:gender]
    @pigeon.lives = params[:lives]    
    @pigeon.save
    redirect "/pigeons/#{@pigeon.id}"
  end
  
  delete '/pigeons/:id' do
    @pigeon = Pigeon.find_by_id(params[:id])
    @pigeon.delete
    redirect '/pigeons'
  end
  
end

require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @new_post = Post.create(name: params[:name], content: params[:content])
    @posts = Post.all
    erb :index
  end

  get '/posts' do
    @posts = Post.all

    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by(id: params[:id])

    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find_by(id: params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    post = Post.find_by(id: params[:id])
    if params[:name] != post.name
      post.update(name: params[:name])
    end
    if params[:content] != post.content
      post.update(content: params[:content])
    end
    @post = post
    erb :show
  end

  delete '/posts/:id/delete' do
    Post.delete(params[:id])

    erb :delete
  end
end

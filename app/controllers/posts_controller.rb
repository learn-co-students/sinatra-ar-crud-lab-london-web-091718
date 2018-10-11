class PostsController < ApplicationController

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  patch '/posts/:id' do
    @post = Post.update(params[:id], name: params[:name], content: params[:content])
    redirect "/posts/#{@post.id}"
  end

  post '/posts' do
    @post = Post.create(params)
    redirect "/posts"
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  delete '/posts/:id' do
    Post.destroy(params[:id])
    redirect '/posts'
  end

end

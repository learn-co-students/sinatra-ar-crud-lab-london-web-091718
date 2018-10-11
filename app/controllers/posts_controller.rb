class PostsController < ApplicationController

  # GET: /posts
  get "/posts" do
    @posts = Post.all
    erb :"/posts/index"
  end

  # GET: /posts/new
  get "/posts/new" do
    erb :"/posts/new"
  end

  # POST: /posts
  post "/posts" do
    @post = Post.create(params)
    redirect "/posts"
  end

  # GET: /posts/5
  get "/posts/:id" do
    @post = Post.find(params[:id])
    erb :"/posts/show"
  end

  # GET: /posts/5/edit
  get "/posts/:id/edit" do
    @post = Post.find(params[:id])
    erb :"/posts/edit"
  end

  # UPDATE/PATCH: /posts/5
  patch "/posts/:id" do
    #binding.pry
    @post = Post.find(params[:id])
    #binding.pry
    @post.update(name: params[:name], content: params[:content])
    redirect "/posts/#{@post.id}"
  end

  # DELETE: /posts/5/delete
  delete "/posts/:id/delete" do
    post = Post.find(params[:id])
    post.destroy
    redirect "/posts"
  end
end

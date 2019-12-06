
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  get '/articles/new' do
    erb :new
  end
  
  post '/articles' do
    Article.create(params)
    redirection = '/articles/' + Article.find(Article.all.last.id).id.to_s
    redirect redirection
    redirect '/articles'
  end
  
  get '/articles' do
    @articles = Article.all
    erb :index
  end
  
  get '/articles/:id' do
    @article = Article.find(params["id"])
    erb :show
  end
  
  get '/articles/:id/edit' do
    @article = Article.find(params["id"])
    erb :edit
  end
  
  patch '/articles/:id' do
    new_info = {}
    article = Article.find(params["id"])
    new_info[:title] = params["title"]
    new_info[:content] = params["content"]
    article.update(new_info)
    
    redirect "/articles/#{params["id"]}"

    id = params["id"]

    
  end
  
  
<<<<<<< HEAD
  delete '/articles/:id/delete' do
    @article = Article.find(params["id"])
    @article.destroy
    redirect "/articles"
  end
  
  
  
  
=======
>>>>>>> d55c1bdbc78a57132baf6ddbf9e2c63520b48d9a
end

require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/pizza.rb')

# INDEX ROUTE
get '/pizzas' do
  @pizzas = Pizza.all
  erb(:index)
end

# NEW ROUTE
get '/pizzas/new' do
  erb(:new)
end

# EDIT ROUTE
get '/pizzas/:id/edit' do
  @pizza = Pizza.find(params[:id])
  erb(:edit)
end

# UPDATE ROUTE
post '/pizzas/:id' do
  @pizza = Pizza.new(params)
  @pizza.update
  erb(:update)
end

# SHOW ROUTE
get '/pizzas/:id' do
  @pizza = Pizza.find( params[:id] )
  erb(:show)
end

# CREATE ROUTE
post '/pizzas' do
  @pizza = Pizza.new(params)
  @pizza.save
  erb(:create)
end

# DESTROY ROUTE
post '/pizzas/:id/delete' do
  @pizza = Pizza.find(params[:id])
  @pizza.delete
  redirect to '/pizzas'
end

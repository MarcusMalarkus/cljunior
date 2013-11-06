# home page, immediately redirects
get '/' do
  redirect 'categories/index'
end

# displays all categories
get '/categories/index' do
  @categories = Category.all
  erb :'category/index'
end

# render a form for a new category
get '/categories/new' do
  erb :'category/new'
end

# creates a new category, saves to db
post '/categories' do
  @category = Category.create(:name => params[:category_name])
  redirect "categories/#{@category.id}"
end

# category show page
get '/categories/:id' do
  @category = Category.find(params[:id])
  erb :'category/show'
end

# renders a form for a new post, belonging to a specific category
get '/categories/:id/posts/new' do
  @category = Category.find(params[:id])
  erb :'post/new'
end

# saves a post to the db, associates it with a specific category
post '/posts' do
  @category = Category.find(params[:category_id])
  @post = Post.create(params[:post])
  @category.posts << @post
  # This is a refactored form of the previous lines
  # because a category has many posts- and we defined that relationship
  # earlier in the classes, we can shorten up the code to the following
  # @category.posts.create(params[:post])
  redirect "categories/#{@category.id}"
end

## post show page
get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :'post/show'
end
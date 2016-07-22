require('bundler/setup')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @stores = Store.all().order('name DESC')
  @brands = Brand.all().order('name DESC')
  erb(:index)
end

get('/stores/:id') do
  @store = Store.find(params['id'].to_i)
  @brands = Brand.all()
  @brands_within = @store.brands()
  erb(:store_page)
end

patch('/store/update_name') do
  store = Store.find(params['store_id'].to_i)
  name = params['update_name']
  store.update({:name => name})
  redirect('/stores/' + store.id().to_s)
end

patch('/store/brands') do
  store = Store.find(params['store_id'].to_i)
  params['brand_ids'].each() do |id|
    store.brands.push(Brand.find(id.to_i))
  end
  redirect('/stores/' + store.id().to_s)
end

post('/stores/new') do
  Store.create({:name => params['new_store']})
  redirect('/')
end

post('/brands/new') do
  Brand.create({:name => params['new_brand']})
  redirect('/')
end

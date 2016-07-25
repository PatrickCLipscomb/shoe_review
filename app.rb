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

get('/brands/:id') do
  @brand = Brand.find(params['id'].to_i)
  @stores = @brand.stores()
  erb(:brand_page)
end

delete('/stores/:id') do
  store = Store.find(params['id'].to_i)
  store.delete
  redirect('/')
end

delete('/brands/:id') do
  brand = Brand.find(params['id'].to_i)
  brand.delete
  redirect('/')
end

patch('/brands/:id/update_name') do
  brand = Brand.find(params['id'].to_i)
  brand.update({:name => params['update_name']})
  redirect('/brands/' + brand.id.to_s)
end

patch('/stores/:id/update_name') do
  store = Store.find(params['id'].to_i)
  store.update({:name => params['update_name']})
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

patch('/store/brand/delete') do
  store = Store.find(params['store_id'].to_i)
  brand = Brand.find(params['brand_id'].to_i)
  store.brands.delete(brand)
  redirect('/stores/' + store.id().to_s)
end

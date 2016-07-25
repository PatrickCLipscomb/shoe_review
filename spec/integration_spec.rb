require('spec_helper')

describe 'Store path', type: :feature do
  it "adds a store" do
    visit '/'
    fill_in 'new_store', with: 'new store'
    click_button 'Add Store'
    expect(page).to have_content('New store')
  end

  it "edits a store" do
    test_store = Store.create({name: 'store'})
    visit '/stores/' + test_store.id.to_s
    fill_in 'update_name', with: 'story'
    click_button 'Update Name'
    expect(page).to have_content('story')
  end

  it "deletes a store" do
    test_store = Store.create({name: 'store'})
    visit '/'
    click_button ''
    expect(page).to have_content('No Stores have been added yet')
  end
end

describe 'Brand path', type: :feature do
  it "adds a brand" do
    visit '/'
    fill_in 'new_brand', with: 'new brand'
    click_button 'Add Brand'
    expect(page).to have_content('New brand')
  end

  it "edits a brand" do
    test_brand = Brand.create({name: 'brand'})
    visit '/brands/' + test_brand.id.to_s
    fill_in 'update_name', with: 'brandy'
    click_button 'Update Name'
    expect(page).to have_content('brandy')
  end

  it "deletes a brand" do
    test_brand = Brand.create({name: 'brand'})
    visit '/'
    click_button ''
    expect(page).to have_content('No Brands have been added yet')
  end
end

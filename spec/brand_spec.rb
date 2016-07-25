require('spec_helper')

describe Brand do
  it "validates the presence of name" do
    test_brand = Brand.new({:name => ''})
    expect(test_brand.save()).to(eq(false))
  end
  it "validates that each brand can have multiple stores" do
    test_brand = Brand.create({:name => 'freds'})
    test_store = Store.create({:name => 'nike', :brand_ids => test_brand.id})
    test_store2 = Store.create({:name => 'adidas', :brand_ids => test_brand.id})
    expect(test_brand.stores()).to(eq([test_store, test_store2]))
  end
  describe('#format_name') do
    it "ensures that the name of the created brand is capitalized upon creation" do
      test_brand = Brand.create({:name => 'nike'})
      expect(test_brand.name()).to(eq('Nike'))
    end
  end
end

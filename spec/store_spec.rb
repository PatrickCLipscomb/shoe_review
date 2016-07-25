require('spec_helper')

describe Store do
  it "validates the presence of name" do
    test_store = Store.new({:name => ''})
    expect(test_store.save()).to(eq(false))
  end
  it "validates that each store can have multiple brands" do
    test_store = Store.create({:name => 'freds'})
    test_brand = Brand.create({:name => 'nike', :store_ids => test_store.id})
    test_brand2 = Brand.create({:name => 'adidas', :store_ids => test_store.id})
    expect(test_store.brands()).to(eq([test_brand, test_brand2]))
  end
  describe('#format_name') do
    it "ensures that the name of the created store is capitalized upon creation" do
      test_store = Store.create({:name => 'nike'})
      expect(test_store.name()).to(eq('Nike'))
    end
  end
end

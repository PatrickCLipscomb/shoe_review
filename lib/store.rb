class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  validates :name, presence: true
  before_create(:format_name)

private
  define_method(:format_name) do
    self.name = name().capitalize()
  end
end

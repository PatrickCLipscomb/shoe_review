class CreateBrands < ActiveRecord::Migration
  def change
    create_table(:brands) do |t|
      t.column(:name, :varchar)
    end
  end
end

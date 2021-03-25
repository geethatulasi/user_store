class AddStoreRefToAddress < ActiveRecord::Migration[5.2]
  def change
    add_reference :addresses, :store, foreign_key: true
  end
end

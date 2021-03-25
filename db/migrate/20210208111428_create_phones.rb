class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones do |t|
      t.string :number
      t.boolean :alloted, default: false
      t.boolean :special, default: false

      t.timestamps
    end
  end
end

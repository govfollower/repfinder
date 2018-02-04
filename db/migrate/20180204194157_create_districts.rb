class CreateDistricts < ActiveRecord::Migration[5.1]
  def change
    create_table :districts do |t|
      t.belongs_to :state, index: true

      t.integer :number

      t.timestamps null: false
    end
  end
end

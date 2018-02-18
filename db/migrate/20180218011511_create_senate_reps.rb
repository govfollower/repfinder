class CreateSenateReps < ActiveRecord::Migration[5.1]
  def change
    create_table :senate_reps do |t|
      t.belongs_to :state, index: true

      t.string :propublica_id
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :gender
      t.date :dob
      t.string :party
      t.boolean :in_office
      t.integer :reelection_year
      t.integer :first_elected_year
      t.integer :terms_served
      t.string :phone
      t.string :website_url
      t.string :contact_form_url
      t.string :twitter_account
      t.string :facebook_account

      t.timestamps null: false
    end
  end
end

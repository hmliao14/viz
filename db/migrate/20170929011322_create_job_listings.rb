class CreateJobListings < ActiveRecord::Migration[5.1]
  def change
    create_table :job_listings do |t|
      t.string :title
      t.date :post_date
      t.string :keywords
      t.string :category
      t.string :company_name
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end

class AddEndDateToForm < ActiveRecord::Migration[5.1]
  def change
    add_column :graphs, :job_end_date, :date
  end
end

class AddBeginDateToForm < ActiveRecord::Migration[5.1]
  def change
    add_column :graphs, :job_begin_date, :date
  end
end

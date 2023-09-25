class AddBodyToVacancy < ActiveRecord::Migration[7.0]
  def change
    add_column :vacancies, :body, :text
  end
end

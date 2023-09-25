class AddNotNullToBody < ActiveRecord::Migration[7.0]
  def change
    change_column :vacancies, :body, :text, null: false
  end
end

class CreateVacancies < ActiveRecord::Migration[7.0]
  def change
    create_table :vacancies do |t|
      t.bigint :external_id, null: false
      t.string :external_source, null: false
      t.string :url, null: false
      t.string :title, null: false
      t.string :user_login, null: false
      t.string :user_avatar_url, null: false
      t.string :user_profile_url, null: false
      t.jsonb :labels, null: false, default: {}
      t.timestamps
    end
  end
end

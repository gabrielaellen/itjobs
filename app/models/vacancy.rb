class Vacancy < ApplicationRecord
    validates :external_id, :external_source, :url, :title, :user_login, :user_avatar_url, :user_profile_url, :labels, :body, presence: true
end



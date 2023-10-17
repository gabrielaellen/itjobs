class Vacancy < ApplicationRecord
  SOURCES = {
    'frontendbr/vagas' => 'Front-End BR - Vagas',     
    'backend-br/vagas' => 'Back-End BR - Vagas',
    'react-brasil/vagas' => 'React BR - Vagas',
    'qa-brasil/vagas' => 'QA BR - Vagas'
  }.freeze

    validates :external_id, :external_source, :url, :title, :user_login, :user_avatar_url, :user_profile_url, :labels, :body, presence: true
end



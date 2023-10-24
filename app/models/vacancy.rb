class Vacancy < ApplicationRecord
  SOURCES = {
    "frontendbr/vagas" => "Front-End BR - Vagas",
    "backend-br/vagas" => "Back-End BR - Vagas",
    "react-brasil/vagas" => "React BR - Vagas",
    "qa-brasil/vagas" => "QA BR - Vagas"
  }.freeze

  searchkick(
    batch_size: 10_000,
    word_start: [:name]
  )

  validates :external_id, :external_source, :url, :title, :user_login, :user_avatar_url, :user_profile_url, :labels, :body, presence: true

  def tags
    parsed_tag = JSON.parse(labels)
    parsed_tag.map do |sub_array|
      sub_array.to_h
    end
  end

  def search_data
    attributes.merge(
      labels: tags.map { |l| l["name"] }
    )
  end
end

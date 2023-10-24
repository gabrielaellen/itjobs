require "octokit"

class PopulateVacanciesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    client = Octokit::Client.new

    Vacancy::SOURCES.each do |key, value|
      issues = client.issues(key, state: "open")

      issues.each do |issue|
        vacancy = Vacancy.find_or_initialize_by(external_id: issue.id)

        vacancy.external_id = issue.id
        vacancy.external_source = key
        vacancy.url = issue.html_url
        vacancy.title = issue.title
        vacancy.user_login = issue.user.login
        vacancy.user_avatar_url = issue.user.avatar_url
        vacancy.user_profile_url = issue.user.url
        vacancy.labels = issue.labels.to_json
        vacancy.created_at = issue.created_at
        vacancy.updated_at = issue.updated_at
        vacancy.body = issue.body

        vacancy.save!
      end
    end
  end
end

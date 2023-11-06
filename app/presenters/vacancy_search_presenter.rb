# frozen_string_literal: true

class VacancySearchPresenter
  attr_reader :options, :query

  def initialize(query: nil, options: {})
    @query = query.presence || "*"
    @options = options
  end

  def search
    constraints = {
      page: options[:page],
      per_page: 20,
      fields: [:title, :labels]
    }

    constraints[:where] = where
    constraints[:order] = order
    constraints[:aggs] = aggs

    Vacancy.search(query, **constraints)
  end

  private

  def where
    where = {}

    where[:user_login] = options[:user] if options[:user].present?
    where[:labels] = options[:label] if options[:label].present?
    where[:external_source] = options[:source] if options[:source].present?

    where
  end

  def aggs
    {
      labels: {order: {_key: "asc"}}
    }
  end

  def order
    default = {created_at: :desc}
  end
end

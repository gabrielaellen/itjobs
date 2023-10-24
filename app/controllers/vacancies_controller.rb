class VacanciesController < ApplicationController
    include Pagy::Backend

    def index
        @vacancies = VacancySearchPresenter.new(query: params[:q], options: search_params).search
        @pagy = Pagy.new_from_searchkick(@vacancies)
        @start_date = params[:start_date]
        @end_date = params[:end_date]
    end

    def show
    end

    private

    def search_params
        params.permit(:q, :page, :user, :label, :source)
    end
end

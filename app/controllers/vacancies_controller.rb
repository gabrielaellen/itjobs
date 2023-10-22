class VacanciesController < ApplicationController
    include Pagy::Backend

    def index
        @vacancies = VacancySearchPresenter.new(query: params[:q], options: search_params).search
        @pagy = Pagy.new_from_searchkick(@vacancies)
    end

    def show
    end

    private

    def search_params
        params.permit(:q, :page, :user, :label, :source)
    end
end

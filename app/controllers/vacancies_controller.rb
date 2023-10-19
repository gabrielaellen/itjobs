class VacanciesController < ApplicationController

    def index
        @vacancies = VacancySearchPresenter.new(query: params[:q], options: search_params).search
    end

    def show
    end

    private 
    
    def search_params
        params.permit(:q, :page, :user, :label, :source)
    end
end

class VacanciesController < ApplicationController

    def index
        @vacancies = Vacancy.limit(6)
    end

    def show
    end
end

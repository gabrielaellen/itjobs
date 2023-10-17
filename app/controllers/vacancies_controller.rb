class VacanciesController < ApplicationController

    def index
        @vacancies = Vacancy.limit(10)
    end

    def show
    end
end

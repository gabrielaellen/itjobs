desc "This task is called by the Heroku scheduler add-on"
task update_vacancies: :environment do
  puts "Updating vacancies..."
  PopulateVacanciesJob.perform_later
  puts "done."
end

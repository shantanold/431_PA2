duplicate_movies = Movie.group(:title).having('count(*) > 1').pluck(:title)

duplicate_movies.each do |title|
    duplicate_entries = Movie.where(title: title).order(:created_at).all[1..-1]
    duplicate_entries.each(&:destroy)
  end
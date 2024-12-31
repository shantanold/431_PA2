class RemoveDuplicateMovies < ActiveRecord::Migration[8.0]
  def up
    # First find all duplicate movies based on title
    duplicates = Movie.select(:title).group(:title).having('count(*) > 1')
    
    duplicates.each do |movie|
      # Get all movies with this title, ordered by creation date
      dupes = Movie.where(title: movie.title).order(created_at: :asc)
      
      # Skip the first one (keep it) and destroy the rest
      dupes.offset(1).destroy_all
    end
  end

  def down
    # Can't restore deleted records
    raise ActiveRecord::IrreversibleMigration
  end
end
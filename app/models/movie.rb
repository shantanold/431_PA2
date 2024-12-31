class Movie < ApplicationRecord
    SORTABLE_COLUMNS = %w[title rating release_date]
    scope :sorted_by, ->(column, direction = 'asc') {
        if SORTABLE_COLUMNS.include?(column) && %w[asc desc].include?(direction)
          order("#{column} #{direction}")
        else
          all
        end
      }
    end
module ApplicationHelper
    # Toggle sorting direction
    def toggle_direction(column)
      if column == session[:sort_by]
        session[:direction] == 'asc' ? 'desc' : 'asc'
      else
        'asc'
      end
    end
  
    # Highlight the sorted column
    def highlight_sort(column)
      return '' unless column == session[:sort_by]
  
      session[:direction] == 'asc' ? 'sorted-asc' : 'sorted-desc'
    end
  
    # Add a visual sort cue
    def sort_cue(column)
      return '' unless column == session[:sort_by]
  
      session[:direction] == 'asc' ? '↑' : '↓'
    end
  end
  
module ArticlesHelper

  # We use these helper methods to had functions that we are going to use in our views

  def persisted_comments(comments)
    comments.reject{ |comment|  # reject - returns an array for all elements of enum for which block is false
                      comment.new_record?  # .new_record? - returns true if this object hasn’t been saved yet
                    }  # means we only want comments that are coming from the database - nothing that is new and hasn't been saved yet
  end

end

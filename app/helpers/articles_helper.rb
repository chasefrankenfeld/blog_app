module ArticlesHelper

  # We use these helper methods to had functions that we are going to use in our views

  def persisted_comments(comments)
    comments.reject{ |comment| comment.new_record? }  # means we only want comments that are coming from the database. Nothing that is new.
  end

end

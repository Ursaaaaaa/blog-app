class Comment < ApplicationRecord
  belongs_to :author_id, class_name: 'User'
  belongs_to :post_id, class_name: 'Post'

  after_save :update_comments_counter

  def update_comments_counter
    post.increment!(:commentsCounter)
  end
end

class Article < ApplicationRecord

  validates :title, presence: true
  validates :body, presence: true

  default_scope { order(created_at: :desc) }  # can also add to the index - .order('created_at DESC')

  belongs_to :user

  has_many :comments, dependent: :destroy
end

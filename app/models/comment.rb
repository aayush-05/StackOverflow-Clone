class Comment < ApplicationRecord
  validates :body, presence: true
  belongs_to :user
  belongs_to :question
  validates :user, presence: true
  validates :question, presence: true
  default_scope -> {order(created_at: :desc)}
end

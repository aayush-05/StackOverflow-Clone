class Question < ApplicationRecord
  validates :heading, presence: true, length: {minimum: 10, maximum: 300}
  validates :description, length: {maximum: 1000}
  belongs_to :user

  has_many :question_tags
  has_many :tags, through: :question_tags
  has_many :comments, dependent: :destroy
end

class Tag < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name

  has_many :question_tags
  has_many :questions, through: :question_tags
end

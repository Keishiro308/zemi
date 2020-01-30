class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :posts, through: :taggings
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}
end

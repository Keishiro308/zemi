class Post < ApplicationRecord
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :bookmarkings, dependent: :destroy
  has_many :like_users, through: :bookmarkings, source: :user
  has_rich_text :content
  validates :title, presence: true
  validates :content, presence: true

  def save_tags(tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    # Destroy old taggings:
    old_tags.each do |old_tagname|
      self.tags.delete Tag.find_by(name:old_tagname)
    end

    # Create new taggings:
    new_tags.each do |new_tagname|
      post_tag = Tag.find_or_create_by(name:new_tagname)
      self.tags << post_tag
    end
  end

  def liked_by?(user)
    self.like_users.include?(user)
  end
  
end

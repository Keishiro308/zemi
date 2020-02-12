class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable, :timeoutable
  has_many :posts, dependent: :destroy
  has_many :bookmarkings, dependent: :destroy
  has_many :like_posts, through: :bookmarkings, source: :post
  validates :name, presence: true
  
  def like?(post)
    self.like_posts.include?(post)
  end
  
end

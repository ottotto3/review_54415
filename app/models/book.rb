class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.search(method,keyword)
    if method == "exact"
      Book.where(title: keyword)
    elsif method == "partial"
      Book.where('title LIKE ?','%'+ keyword + '%')
    elsif method == "forward"
      Book.where('title LIKE ?', keyword + '%')
    elsif method == "backward"
      Book.where('title LIKE ?','%'+ keyword)
    end
  end
#インデントが揃っていて見やすくなっています。
end

class Like < ApplicationRecord
  #Likemodelのuser_idとUserクラスを結びつける
  belongs_to :user
  belongs_to :post
  #組み合わせが重複しない設定
  validates :user_id, uniqueness: { scope: :post_id }
end

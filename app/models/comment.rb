class Comment < ApplicationRecord
  #commentモデルのuser_idとUserのidが関連
  belongs_to :user
  #commentモデルのpost_idとPostのidが関連
  belongs_to :post
end

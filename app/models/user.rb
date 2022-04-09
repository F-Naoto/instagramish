class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  #デフォルトでは、{モデルname}s
  #UserモデルのidとLikeモデルのこのモデル（User）_idを結びつける
  #違う場合は、class_name,foreign_keyの設定が必要
  #active_relationships => active_relationshipモデルを探しにいくので、いやいや、そういうことじゃない。
  #Relationshipモデルのuser_idと結びつけてね。
  # class_name:"Relationship"
  # foreign_key:"user_id"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 50 }

  def update_without_current_password(params, *options)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end

end
class LikesController < ApplicationController

  before_action :authenticate_user!

  def create
    #User.new(user_id:current_user.id,post_id:XXX)
    @like = current_user.likes.build(post_params)
    @post = @like.post
    if @like.save
      respond_to :js
    end
  end

  def destroy
    @like = Like.find_by(id: params[:id])
    @post = @like.post
    if @like.destroy
      respond_to :js
    end
  end

  private
    def post_params
      params.permit(:post_id)
    end
end

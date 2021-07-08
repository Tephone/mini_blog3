class RelationshipsController < ApplicationController
  def create
    @users = User.all.page(params[:page]).per(10) #users/indexにrenderするために必要
    if current_user.active_relationships.create(followed_id: params[:relationship][:followed_id])
      redirect_to blogs_path, notice: "#{current_user.followings.last.name}さんをフォローしました"
    else
      render 'users/index'
    end
  end

  def destroy
    active_relationships_record = current_user.active_relationships.find(params[:id])
    active_relationships_record.destroy!
    redirect_to blogs_path, notice: "#{active_relationships_record.followed.name}さんのフォローを解除しました"
  end
end

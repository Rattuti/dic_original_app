class BookmarksController < ApplicationController
    before_action :authenticate_user!, only: ['create']

    def create
        bookmark = Bookmark.new(article_id: params[:id], user_id: current_user.id)

        if bookmark.save
            render json: { id: bookmark.id, email: current_user.uid, message: '成功しました' }, status: :ok
        else
            render json: { message: '保存出来ませんでした', errors: bookmark.errors.messages }, status: :bad_request
        end
    end

    def destroy
        bookmark = Bookmark.find(params[:id])
    
        if bookmark.destroy
            render json: { id: bookmark.id, email: bookmark.user.uid, message: '削除に成功しました' }, status: :ok
        else
            render json: { message: '削除できませんでした', errors: bookmark.errors.messages }, status: :bad_request
        end
    end

end

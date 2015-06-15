class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
    set_comment
  end


  def new
    @comment = Comment.new
    @all_users = User.select_users
    @all_links = Link.select_links
  end


  def edit
    set_comment
    @all_users = User.select_users
    @all_links = Link.select_links
  end


  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to @comment, notice: 'Comment was successfully created.'
    else
      render :new
    end
  end


  def update
    set_comment
    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    set_comment
    @comment.destroy
    redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :link_id)
  end
end

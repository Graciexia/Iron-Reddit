class VotesController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]

  def index
    @votes = Vote.all
  end


  def show
    set_vote
  end


  def new
    @vote = Vote.new
    @all_users = User.select_users
    @all_links = Link.select_links
    @all_comments = Comment.select_comments
  end


  def edit
    set_vote
    @all_users = User.select_users
    @all_links = Link.select_links
    @all_comments = Comment.select_comments
  end


  def create
    @vote = Vote.new(vote_params)

      if @vote.save
        redirect_to @vote, notice: 'Vote was successfully created.'
      else
        render :new
      end

  end


  def update
    set_vote

      if @vote.update(vote_params)
        redirect_to @vote, notice: 'Vote was successfully updated.'
      else
        render :edit
      end

  end


  def destroy
    set_vote
    @vote.destroy
    redirect_to votes_url, notice: 'Vote was successfully destroyed.'

  end

  private
    def set_vote
      @vote = Vote.find(params[:id])
    end

    def vote_params
      params.require(:vote).permit(:number,:voter_user_id, :vote_direction, :user_id, :link_id, :comment_id)
    end
end

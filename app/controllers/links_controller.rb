class LinksController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]


  def index
    # @links_and_votes = Link.all
    @links_and_votes = Link.select('links.id, post, title, sum(number) as "vote_count"')
                           .joins('left join votes on votes.link_id = links.id')
                           .group('links.id')
  end

  def show
    set_link
  end

  def new
    @link = Link.new
    @all_users = User.select_users
    @all_categories = Board.select_categories
  end

  def edit
    set_link
    @all_users = User.select_users
    @all_categories = Board.select_categories
  end


  def create
    @link = Link.new(link_params)

    if @link.save
      redirect_to @link, notice: 'Link was successfully created.'
    else
      render :new
    end
  end

  def update
    set_link
    if @link.update(link_params)
      redirect_to @link, notice: 'Link was successfully updated.'
    else
      render :edit
    end

  end


  def destroy
    set_link
    @link.destroy
    redirect_to links_url, notice: 'Link was successfully destroyed.'
  end

  private
  def set_link
    @link = Link.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:post, :title, :user_id, :board_id)
  end
end

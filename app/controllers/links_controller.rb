class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @links = Link.all
  end

  def show
  end

  def new
    @link = current_user.links.build
  end

  def edit
  end

  def create
    @link = current_user.links.build(link_params)
    if @link.save
      redirect_to @link, notice: "Link successfully created!"
    else
      render :new
    end
  end

  def update
    if @link.update(link_params)
      redirect_to @link, notice: "Link successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @link.destroy
    redirect_to links_url, alert: "Link successfully deleted!"
  end

  def upvote
    @link = Link.find(params[:id])
    @link.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @link = Link.find(params[:id])
    @link.downvote_by current_user
    redirect_to :back
  end

  private

    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:title, :url)
    end
end

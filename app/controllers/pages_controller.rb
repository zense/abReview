class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def show
    @page = Page.find_by_slug(params[:slug])
    render :inline => @page.content.html_safe, :layout => true
  end

  def review
    @abstract_docs = current_user.abstract_reviews
    @title = "Pending Abstracts"
    render "abstract_docs/index"
  end
end

class PagesController < ApplicationController
  def show
    @page = Page.find_by_slug(params[:slug])
    render :inline => @page.content.html_safe, :layout => true
  end
end

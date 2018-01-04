class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def show
    @page = Page.find_by_slug(params[:slug])
    render :inline => @page.content.html_safe, :layout => true
  end

  def abstract
    if current_user.abstract_docs.length > 0
      redirect_to current_user.abstract_docs.first
    else
      redirect_to new_abstract_doc_url
    end
  end
end

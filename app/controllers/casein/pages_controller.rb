# Scaffolding generated by Casein v5.3.0.0

module Casein
  class PagesController < Casein::CaseinController
    ## optional filters for defining usage according to Casein::AdminUser access_levels
    # before_action :needs_admin, except: [:action1, :action2]
    # before_action :needs_admin_or_current_user, only: [:action1, :action2]
  
    def index
      @casein_page_title = 'Pages'
      @pages = Page.order(sort_order(:title)).paginate page: params[:page]
    end

    def show
      @casein_page_title = 'View page'
      @page = Page.find params[:id]
    end

    def new
      @casein_page_title = 'Add a new page'
      @page = Page.new
    end

    def create
      @page = Page.new page_params

      if @page.save
        flash[:notice] = 'Page created'
        redirect_to casein_pages_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new page'
        render action: :new
      end
    end

    def update
      @casein_page_title = 'Update page'

      @page = Page.find params[:id]

      if @page.update_attributes page_params
        flash[:notice] = 'Page has been updated'
        redirect_to casein_pages_path
      else
        flash.now[:warning] = 'There were problems when trying to update this page'
        render action: :show
      end
    end

    def destroy
      @page = Page.find params[:id]

      @page.destroy
      flash[:notice] = 'Page has been deleted'
      redirect_to casein_pages_path
    end

    private

    def page_params
      params.require(:page).permit(:title, :content, :slug)
    end
  end
end

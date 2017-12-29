class AbstractDocsController < ApplicationController
  before_action :set_abstract_doc, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_viewer, only: [:show]

  before_action :authenticate_editor, only: [:edit, :update, :destroy]
  # GET /abstract_docs
  # GET /abstract_docs.json
  def index
    @abstract_docs = AbstractDoc.where(user_id: current_user.id)
  end

  # GET /abstract_docs/1
  # GET /abstract_docs/1.json
  def show
  end

  # GET /abstract_docs/new
  def new
    @abstract_doc = AbstractDoc.new
  end

  # GET /abstract_docs/1/edit
  def edit
  end

  # POST /abstract_docs
  # POST /abstract_docs.json
  def create
    @abstract_doc = AbstractDoc.new(abstract_doc_params)
    @abstract_doc.user_id = current_user.id
    respond_to do |format|
      if @abstract_doc.save
        format.html { redirect_to @abstract_doc, notice: 'Abstract doc was successfully created.' }
        format.json { render :show, status: :created, location: @abstract_doc }
      else
        format.html { render :new }
        format.json { render json: @abstract_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /abstract_docs/1
  # PATCH/PUT /abstract_docs/1.json
  def update
    respond_to do |format|
      if @abstract_doc.update(abstract_doc_params)
        format.html { redirect_to @abstract_doc, notice: 'Abstract doc was successfully updated.' }
        format.json { render :show, status: :ok, location: @abstract_doc }
      else
        format.html { render :edit }
        format.json { render json: @abstract_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abstract_docs/1
  # DELETE /abstract_docs/1.json
  def destroy
    @abstract_doc.destroy
    respond_to do |format|
      format.html { redirect_to abstract_docs_url, notice: 'Abstract doc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def authenticate_viewer
      unless (@abstract_doc.reviewers + [@abstract_doc.user]).include?(current_user)
        redirect_to root_url
      end
    end

    def authenticate_editor
      redirect_to root_url unless @abstract_doc.user == current_user
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_abstract_doc
      @abstract_doc = AbstractDoc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def abstract_doc_params
      params.require(:abstract_doc).permit(:title, :attachment, :category_id, :status)
    end
end

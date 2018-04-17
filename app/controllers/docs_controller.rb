class DocsController < ApplicationController

  before_action :authenticate_user!
 
  before_action :find_doc, only: [:show, :edit, :update, :destroy]

  def index
    @docs = Doc.where( user_id: current_user)
    # 只有他自己(current_user)的Docs
  end

  def show
  end

  def new
    @doc = current_user.docs.new
  end

  def create
    @doc = current_user.docs.new(doc_params)
    if @doc.save
      redirect_to doc_path(@doc)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @doc.update(doc_params)
      redirect_to doc_path(@doc)
    else
      render :edit
    end
  end

  def destroy
    @doc.destroy
    redirect_to docs_path
  end

  private

  def doc_params
    params.require(:doc).permit(:title, :content, :user_id)
  end

  def find_doc
    @doc = Doc.find(params[:id])
  end
end

class PostingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @postings = Posting.all
    render 'index'
  end

  def update
    @posting = Posting.find(params[:id])
    if @posting.update(posting_params)
      render 'show'
    else
      @errors = @posting.errors.messages
      render 'errors/show'
    end
  end

  def create
    @posting = Posting.new(posting_params)
    if @posting.save
      render 'show'
    else
      @errors = @posting.errors.messages
      render 'errors/show'
    end
  end

  def destroy
    @posting = Posting.find(params[:id])
    if @posting.destroy
      render 'postings/delete'
    else
      @errors = @posting.errors.messages
      render 'errors/show'
    end
  end
  

  def posting_params
    params.require(:posting).permit(:title, :description, :contact_email, :contact_phone, :price)
  end
end

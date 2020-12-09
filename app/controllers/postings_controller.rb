class PostingsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_posting_belongs_to_current_user, only: %i[update destroy upload_picture]

  def check_posting_belongs_to_current_user
    @posting = Posting.find(params[:id])
    return if @posting.user_profile_id == current_user.user_profile.id

    @errors = ["Unauthorized to update Posting with id #{@posting.id}"]
    render 'errors/show'
  end

  def index
    @postings = Posting.includes(:favorites).all
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
    @posting.user_profile = current_user.user_profile
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

  def upload_picture
    return unless @posting

    @posting.picture.attach(params[:picture])
    render json: { 'result' => 'success', 'picture': url_for(@posting.picture) }.to_json
  end

  def posting_params
    puts params
    params.require(:posting).permit(:title, :description, :contact_email, :contact_phone, :price, :picture)
  end
end

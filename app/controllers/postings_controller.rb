class PostingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @postings = Posting.all
    render 'index'
  end
end

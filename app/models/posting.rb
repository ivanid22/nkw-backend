class Posting < ApplicationRecord
  before_action :authenticate_user!
end

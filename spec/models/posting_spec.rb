require 'rails_helper'

RSpec.describe Posting, type: :model do
  before :each do
    @user = User.create(email: 'test@domain.com', password: 'test123456');
    @user_profile = UserProfile.create(user: @user, name: 'Test profile')
  end

  it 'should fail to create a posting when no title is provided' do
    posting = Posting.new(contact_email: 'contact@me.com', user_profile: @user_profile);
    expect(posting.valid?).to be(false)
  end

  it 'should fail to create a posting when no user is provided' do
    posting = Posting.new(title: 'Test title');
    expect(posting.valid?).to be(false)
  end
end
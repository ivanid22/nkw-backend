require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before :each do
    User.create(email: 'test@domain.com', password: 'test1234')
    User.create(email: 'test2@domain.com', password: 'test1234')
    UserProfile.create(name: 'Test', user: User.first)
    UserProfile.create(name: 'Test 2', user: User.last)
    5.times do
      Posting.create(user_profile: UserProfile.first, title: 'Test title')
    end
  end

  it 'shoud fail to create a favorite when no posting is provided' do
    favorite = Favorite.new(user_profile: UserProfile.first)
    expect(favorite.valid?).to be(false)
  end

  it 'shoud fail to create a favorite when no user profile is provided' do
    favorite = Favorite.new(posting: Posting.first)
    expect(favorite.valid?).to be(false)
  end

  describe 'exists?' do
    it 'should return true if a favorite already exists for that posting-profile pair' do
      Favorite.create(user_profile: UserProfile.first, posting: Posting.first)
      expect(Favorite.exists?(UserProfile.first.id, Posting.first.id)).to be(true)
    end

    it 'should return false if no favorite exists for that posting-profile pair' do
      expect(Favorite.exists?(UserProfile.first.id, Posting.first.id)).to be(false)
    end
  end

  describe "favorites_by" do
    it 'should return all the favorites by a specific user profile' do
      Favorite.create(user_profile: UserProfile.first, posting: Posting.first)
      Favorite.create(user_profile: UserProfile.first, posting: Posting.last)
      expect(Favorite.favorites_by(UserProfile.first.id).count).to eql(2)
    end
  end

  describe "favorites_for" do
    it 'should return all the favorites for a specific posting' do
      Favorite.create(user_profile: UserProfile.first, posting: Posting.first)
      Favorite.create(user_profile: UserProfile.last, posting: Posting.first)
      expect(Favorite.favorites_for(Posting.first.id).count).to eql(2)
    end
  end
  
  
end

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should fail to create a user with a duplicate email' do
    User.create(email: 'repeated_email@domain.com', password: 'password')
    user_with_repeated_email = User.create(email: 'repeated_email@domain.com', password: 'password')
    expect(user_with_repeated_email.valid?).to be(false)
  end

  it 'should fail to validate a user with a password shorter than 6 characters' do
    user_with_invalid_password = User.new(email: 'test@domain.com', password: '12345')
    expect(user_with_invalid_password.valid?).to be(false)
  end
end

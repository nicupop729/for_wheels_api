require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create!(name: 'Nicu')
  end

  before do
    User.create!(name: 'Tom')
    User.create!(name: 'Alice')
    subject.save
  end

  it 'returns 3 users' do
    expect(User.count).to eq(3)
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is valid if the username is unique' do
    subject.name = 'Nicu'
    expect(subject).to be_valid
  end

  it 'is not valid if the username is not unique' do
    subject.name = 'Tom'
    expect(subject).to_not be_valid
  end
end

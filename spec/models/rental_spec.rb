require 'rails_helper'

RSpec.describe Rental, type: :model do
  let(:user) { User.create!(name: 'John Doe', id: 1) }
  let(:car1) do
    Car.create!(img_url: 'https://elitetraveler.com/wp-content/uploads/2019/07/Screen-Shot-2019-07-05-at-11.13.50-768x515.png',
                model: 'Lamborghini Huracán EVO',
                description: 'Typically, supercars end their model cycles...',
                price: '2,616',
                id: 1)
  end

  let(:car2) do
    Car.create!(img_url: 'https://elitetraveler.com/wp-content/uploads/2019/07/Screen-Shot-2019-07-05-at-10.55.15-768x579.png',
                model: 'Ferrari 488 Pista',
                description: 'Part of the special series sports car segment...',
                price: '3,490',
                id: 2)
  end

  before do
    Rental.new(user_id: user.id, car_id: car2.id, start_date: '02-03-2023', end_date: '02-04-2023', price: 3.490)
    subject.save
  end

  subject do
    Rental.new(user_id: user.id, car_id: car1.id, start_date: '01-01-2023', end_date: '01-02-2023', price: 2.616)
  end

  it 'returns 2 rentals' do
    expect(Rental.where(user_id: user.id).count).to eq(1)
  end

  it 'expects user to have 2 rentals' do
    expect(user.rentals.count).to eq(1)
  end

  it 'belongs to John Doe' do
    expect(subject.user_id).to be(user.id)
  end

  it 'belongs to Lamborghini Huracán EVO' do
    expect(subject.car_id).to be(car1.id)
  end

  it 'is valid if pick up date is in the future' do
    expect(subject.start_date).to be > Date.today
  end

  it 'is valid if drop-off date is after pick up date' do
    expect(subject.start_date).to be < subject.end_date
  end
end

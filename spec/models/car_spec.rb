require 'rails_helper'

RSpec.describe Car, type: :model do
  subject do
    Car.new(img_url: 'https://elitetraveler.com/wp-content/uploads/2019/07/Screen-Shot-2019-07-05-at-11.13.50-768x515.png',
            model: 'Lamborghini Huracán EVO',
            description: 'Typically, supercars end their model cycles...',
            price: '2,616')
  end

  before do
    Car.create!(img_url: 'https://elitetraveler.com/wp-content/uploads/2019/07/Screen-Shot-2019-07-05-at-10.55.15-768x579.png',
                model: 'Ferrari 488 Pista',
                description: 'Part of the special series sports car segment...',
                price: '3,490')
    subject.save
  end
  it 'returns 2 cars' do
    expect(Car.count).to eq(2)
  end
end

require 'rails_helper'

RSpec.describe 'Cars', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/cars'
      expect(response).to have_http_status(:success)
    end
    it 'does not render a different template' do
      get '/cars'
      expect(response).to_not render_template(:show)
    end
  end
end

RSpec.describe 'Users', type: :request do
  before do
    User.create!(name: 'John', id: 1)
    User.create!(name: 'Tom', id: 2)
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end
    it 'returns http success' do
      post '/users', params: { user: { name: 'Nicu' } }
      expect(response).to have_http_status(:success)
    end

    it 'returns http success' do
      get '/users/1', params: { user: { name: 'John' } }
      expect(response).to have_http_status(:success)
    end

    it 'does not render a different template' do
      get '/users'
      expect(response).to_not render_template(:show)
    end
  end
end

RSpec.describe 'Rentals', type: :request do
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
    Rental.new(user_id: user.id, car_id: car2.id, start_date: '02-03-2023', end_date: '02-04-2023', price: 3.490, id: 2)
    subject.save
  end

  subject do
    Rental.new(user_id: user.id, car_id: car1.id, start_date: '01-01-2023', end_date: '01-02-2023', price: 2.616,
               id: 1)
  end

  describe 'GET rentals of particular user' do
    it 'returns http success' do
      get '/users/1/rentals'
      expect(response).to have_http_status(:success)
    end

    it 'returns http success' do
      get '/users/1/rentals/1'
      expect(response).to have_http_status(:success)
    end

    it 'returns http success' do
      post '/users/1/rentals',
           params: { rental: { user_id: user.id, car_id: car1.id,
                               start_date: '01-01-2023', end_date: '01-02-2023',
                               price: 2.616,
                               id: 1 } }
      expect(response).to have_http_status(:success)
    end

    it 'returns http success' do
      delete '/users/1/rentals/1'
      expect(response).to have_http_status(:success)
    end

    it 'does not render a different template' do
      get '/users/1/rentals'
      expect(response).to_not render_template(:show)
    end
  end
end

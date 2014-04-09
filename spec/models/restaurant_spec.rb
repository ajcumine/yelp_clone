require 'spec_helper'

describe Restaurant do

  describe 'validations' do
    it 'is not valid without a name' do
      restaurant = Restaurant.new(name: nil)
      expect(restaurant).to have(1).errors_on(:name)
    end

    it 'is not valid without a location' do
      restaurant = Restaurant.new(location: nil)
      expect(restaurant).to have(1).errors_on(:location)
    end
  end

  describe '#average_score' do
    let(:restaurant) {Restaurant.create(name: 'Yo Sushi', location: 'selfridges')}

    context 'no reviews' do
      it 'should return "No reviews"' do
        expect(restaurant.average_score).to eq('No reviews')
      end
    end

    context '1 review' do
      it 'should return the score of that review' do
        restaurant.reviews.create(rating: 4, comment: 'great')
        expect(restaurant.average_score).to eq(4)
      end
    end

    context 'multiple reviews' do
      it 'should return the score of that review' do
        restaurant.reviews.create(rating: 4, comment: 'great')
        restaurant.reviews.create(rating: 2, comment: 'alright')
        expect(restaurant.average_score).to eq(3)
      end
    end
  end
end
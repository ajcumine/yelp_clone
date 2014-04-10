require 'spec_helper.rb'

describe ReviewsHelper do
  describe '#star_rating' do
    context '0' do
      it 'returns 5 empty stars' do
        expect(star_rating(0)).to eq('☆☆☆☆☆')
      end
    end

    context '1-4' do
      it 'returns 1 full star for each point' do
        expect(star_rating(3)).to eq('★★★☆☆')
      end
    end

    context '5' do
      it 'returns 5 full stars' do
        expect(star_rating(5)).to eq('★★★★★')
      end
    end
  end
end
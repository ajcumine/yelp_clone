require 'spec_helper'

describe 'the restaurant index page' do
  context 'no restaurants have been added' do
    it 'should display a warning message' do
      visit '/restaurants'
      expect(page).to have_content('No restaurants yet')
    end

    describe 'adding a restaurant' do
      it 'should be listed on the index' do
        visit '/restaurants'
        click_link 'Add a restaurant'
        fill_in 'Name', with: 'mcdonuts'
        fill_in 'Category', with: 'donuts'
        fill_in 'Location', with: 'everywhere'
        click_button 'Create Restaurant'
        expect(current_path).to eq('/restaurants')
        expect(page).to have_content('mcdonuts')
      end

      it 'should display errors if bad data is given' do
        visit '/restaurants'
        click_link 'Add a restaurant'
        fill_in 'Name', with: 'some shop'
        click_button 'Create Restaurant'
        expect(page).to have_content('error')
      end
    end
  end

  context 'with existing restaurants' do
    let!(:restaurant){Restaurant.create({name: 'Eat Tokyo', location: 'notting hill'})}

    describe 'editing a restaurant' do
      it 'should update the restaurant details' do
        visit '/restaurants'
        click_link 'Edit'
        fill_in 'Name', with: 'Yo Sushi'
        click_button 'Update Restaurant'
        expect(page).to have_content('Yo Sushi')
      end
    end

    describe 'deleting a restaurant' do
      it 'should permenantly destroy the restaurant record' do
        visit '/restaurants'
        click_link 'Delete Eat Tokyo'
        expect(page).not_to have_content('Eat Tokyo')
        expect(page).to have_content('Restaurant successfully deleted!')
      end
    end

    context 'with reviews posted' do
      before(:each) do
        restaurant.reviews.create(rating: 3, comment: 'alright')
      end

      describe 'the individual restaurant page' do
        it 'displays the review' do
          visit '/restaurants'
          click_link 'Eat Tokyo'
          expect(page).to have_content('alright')
        end
      end
    end
  end
end
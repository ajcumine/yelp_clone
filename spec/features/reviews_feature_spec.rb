require 'spec_helper'

describe 'writing reviews'  do
  
  before(:each) do
    Restaurant.create(name: 'Yo Sushi', location: 'selfridges')
  end

  it 'should change the average score of the restaurant' do
    visit '/restaurants'
    click_link 'Review Yo Sushi'
    fill_in 'Comment', with: 'omnomnom'
    select '5', from: 'Rating'
    click_button 'Create Review'
    expect(page).to have_css '.average_review', text: '5'
  end
end
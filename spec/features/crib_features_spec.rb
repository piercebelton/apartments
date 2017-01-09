require 'rails_helper'

RSpec.feature "CribFeatures", type: :feature do
  context 'Going to a Website' do
    Steps 'Seeing the homepage' do
      Given 'I am on the Index Page' do
        visit '/'
      end
      Then 'I can see Cribs listed' do
        expect(page).to have_content("Listing Cribs")
      end
      And 'I can click a link to add a new crib' do
        click_link 'New Crib'
      end
    end
    Steps 'Adding a new crib' do
      Given 'I am on the new crib page' do
        visit '/cribs/new'
      end
      Then 'I can fill in crib info' do
        fill_in 'crib_street', with: '123 St.'
        fill_in 'crib_city', with: 'San Diego'
        fill_in 'crib_zip', with: '92116'
        fill_in 'crib_state', with: 'CA'
        fill_in 'crib_country', with: 'USA'
        fill_in 'crib_name', with: 'BigSooz'
        fill_in 'crib_phone', with: '4444444'
        fill_in 'crib_contact_hours', with: 'Never.'
      end
      And 'I can submit crib info' do
        click_button 'Create Crib'
      end
      Then 'I can see my new crib' do
        expect(page).to have_content("Crib was successfully created")
        expect(page).to have_content("San Diego")
      end
    end
  end
end

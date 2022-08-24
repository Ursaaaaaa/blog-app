require 'rails_helper'

RSpec.describe 'Users pages test', type: :feature do
  describe 'index page' do
    let(:user) do
      User.create(name: 'Grabrielle', photo: 'Avatar.webp', bio: 'A cute baby', postsCounter: 0)
    end

    it 'shows the Number of posts' do
      user.save
      visit users_path
      expect(page).to have_content("Number of Posts: #{user.postsCounter}")
    end

    it 'redirects to users show page' do
      user.save
      visit users_path
      click_on user.name
      expect(page).to have_content('Posts :')
    end
  end
end

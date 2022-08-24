require 'rails_helper'

RSpec.describe 'users', type: :feature do
  describe 'show page' do
    before :each do
      @user_first = User.create(name: 'Grabrielle', photo: 'Avatar.png', bio: 'A cute baby', postsCounter: 0)

      @post_first = @user_first.posts.new(title: 'Love must lead', text: 'This is my first post')
      @post_first.likesCounter = 0
      @post_first.commentsCounter = 0
      @post_first.update_posts_counter
      @post_first.save

      @post_second = @user_first.posts.new(title: 'Being a good child', text: 'This is my second post')
      @post_second.likesCounter = 0
      @post_second.commentsCounter = 0
      @post_second.update_posts_counter
      @post_second.save

      @post_third = @user_first.posts.new(title: 'Going to school', text: 'This is my third post')
      @post_third.likesCounter = 0
      @post_third.commentsCounter = 0
      @post_third.update_posts_counter
      @post_third.save
    end

    it 'check users#show path' do
      visit user_path(@user_first.id)
      expect(current_path).to eq(user_path(@user_first.id))
      expect(page).to have_text('posts')
    end

    it 'Should set the link of the picture to the img src' do
      visit user_path(@user_first.id)
      all('img').each do |i|
        expect(i[:src]).to eq('/assets/Avatar-6001a3b651eb22a9d76cd8ee19df48a24c4b76de68d0b18172ea9fafaced0bb5.webp')
      end
    end

    it 'Should display the total post number of 6' do
      visit user_path(@user_first.id)
      expect(page).to have_content('Number of Posts: 6')
    end

    it 'Should display user bio' do
      visit user_path(@user_first.id)
      expect(page).to have_content('A cute baby')
    end

    it 'Should display the user first 3 posts' do
      visit user_path(@user_first.id)
      expect(page).to have_content('This is my first post')
      expect(page).to have_content('This is my second post')
      expect(page).to have_content('This is my third post')
    end

    it 'Should display a button with "See all posts" text' do
      visit user_path(@user_first.id)
      expect(page).to have_link('See all posts')
    end

    it 'Should redirect to post page after clicking on "See all posts"' do
      visit user_path(@user_first.id)
      click_link 'See all posts'
      expect(current_path).to eq(user_posts_path(@user_first.id))
    end
  end
end
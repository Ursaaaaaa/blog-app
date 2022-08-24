require 'rails_helper'

RSpec.describe 'Post pages test', type: :feature do
  describe 'show page' do
    before :each do
      @user_first = User.create(name: 'Grabrielle', photo: 'Avatar.webp', bio: 'A cute baby', postsCounter: 0)

      @post_first = @user_first.posts.new(title: 'Love must lead', text: 'This is my first post')
      @post_first.likesCounter = 0
      @post_first.commentsCounter = 0
      @post_first.update_posts_counter
      @post_first.save

      @comment = @user_first.comments.new(post_id: @post_first.id, author_id: @user_first.id, text: 'My first comment')
      @comment.post_id = @post_first.id
      @comment.update_comments_counter
      @comment.save

      @like = Like.new(author_id: @user_first.id, post_id: @post_first.id)
      @like.author = @user_first
      @like.post = @post_first
      @like.save
      @like.update_likes_counter
    end

    it 'check posts#show path' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(current_path).to eq(user_post_path(@user_first.id, @post_first.id))
      expect(page).to have_text('post')
    end

    it 'Should display the post title' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content('Love must lead')
    end

    it 'Should display who wrote the post' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content('Grabrielle')
    end

    it 'Should display the total post comment number of 2' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content('Comments: 2')
    end

    it 'Should display the total post likes number of 2' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content('Likes: 2')
    end

    it 'Should display the post body' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content('This is my first post')
    end

    it 'Should display the name of the user who posted a comment' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content('Grabrielle:')
    end

    it 'Should display the post comment text of a user' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content('My first comment')
    end
  end
end

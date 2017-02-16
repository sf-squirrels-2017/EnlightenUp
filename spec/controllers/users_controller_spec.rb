require 'rails_helper'

describe UsersController do
  let!(:user) { User.create!( name: 'Jadzia',
                              email: 'jadzia@jadzia.com',
                              password:'password',
                              expertise: 'stuff & junk',
                              phase: 3,
                              is_mentor: true )}

  describe 'GET #new' do
    it 'responds with status code 200' do
      get :new
      expect(response).to have_http_status 200
    end

    it 'assigns a new user to @user' do
      get :new
      expect(assigns(:user)).to be_a_new User
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render template(:new)
    end
  end

  describe 'POST #create' do
    context 'when valid params are passed'
      let!(:valid_params) { { name: 'Jadzia',
                              email: 'jadzia@jadzia.com',
                              password:'password',
                              expertise: 'stuff & junk',
                              phase: 3,
                              is_mentor: true } }
      let!(:post_user) { post :create, valid_params }

      before(:each) do |example|
        unless example.metadata[:skip_post]
        post_user
        end
      end

      it 'responds with a status code 302' do
        expect(response).to have_http_status 302
      end

      it 'assigns the newly create game as @user' do
        expect(assigns(:user).id).to eq(User.last.id)
      end

      it 'redirects to the created user\'s profile' do
        expect(response).to redirect_to("/users/#{User.last.id}")
      end
    end

    # context 'when invalid params are passed' do
    #   let!(:invalid_params).to
    # end
end

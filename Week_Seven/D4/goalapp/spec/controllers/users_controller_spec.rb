require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe 'GET #new' do
        it 'renders the new user template' do
            get :new
            expect(response).to render_template(:new)
        end
    end

    describe 'POST #create' do

        let(:user_params) do
            { user: {
                username: 'potato',
                email: 'frenchfries@mcdonalds.edu',
                password: '1234'
            } 
        }
        end
        
        context 'with valid params' do
            it 'saves user to database and logs in user' do
                post :create, params: user_params
                user = User.find_by(username: 'potato')
                expect(session[:session_token]).to eq(user.session_token)
            end
            it 'redirects user\'s show page' do
                post :create, params: user_params
                user = User.find_by(username: 'potato')
                expect(response).to redirect_to(user_url(user))
            end
        end

        context 'without valid params' do
            it 'should validate user params and render new template with errors' do
                post :create, params: { user: { username: 'potato' } }
                expect(response).to render_template(:new)
                expect(flash[:errors]).to be_present
            end
        end
    end
end


require 'rails_helper'

RSpec.describe User, type: :model do
    subject(:user) { FactoryBot.create(:user) }

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }

    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:session_token) }


    describe "ensure_session_token" do
        it "assigns a session token if none is given" do
            expect(FactoryBot.create(:user).session_token).to_not be_nil
        end
    end

    describe "password_encryption" do
        it "does not save passwords to database" do 
            FactoryBot.create(:user, username: 'potato')
            user = User.find_by(username: 'potato')
            expect(user.password).to_not be ('password')
        end
        it "encrypts passwords using BCrypt" do
            expect(BCrypt::Password).to receive(:create).with('potato')
            FactoryBot.build(:user, password: 'potato')
        end
    end
end

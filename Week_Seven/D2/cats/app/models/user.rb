class User < ApplicationRecord
    validates :username, :password_digest, presence: true
    validates :username, :session_token, uniqueness: true
    validates :password, length: {minimum: 6, allow_nil: true }

    attr_reader :password
    
    after_initialize do |user|
        self.session_token ||= self.reset_session_token!
        user.password = self.password_digest
    end

    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64
        self.save!
        self.session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil unless user
        if user.is_password?(password)
            user
        else
            nil
        end
    end
    
end

class User < ApplicationRecord
    validates :email, :session_token, presence: true
    validates :password_digest, presence:true
    validates :pasword, limit: {minimum: 6}

    def self.generate_session_token

    end

    def reset_session_token!

    end

    def ensure_session_token
        self.session_token ||= self.generate_session_token
    end
    
    def password=(password)
        
    end
    
end

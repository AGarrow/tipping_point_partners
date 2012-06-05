class User < ActiveRecord::Base
  belongs_to :company
  attr_accessible :name, :email, :password, :password_confirmation, :company_id
  ROLES = %w[admin company_admin employee ]
    has_secure_password
    
     
   before_save do |user| 
      user.email = email.downcase 
      generate_token(:remember_token) 
      user.name=name.titleize
   end

   
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence:   true,
                      format:     { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation,:company_id, presence: true 
  
   



    def send_password_reset
      generate_token(:password_reset_token)
      self.password_reset_sent_at = Time.zone.now
      save!
      UserMailer.password_reset(self).deliver
    end
    
    def is?(role)
      roles.include?(role.to_s)
    end
    
    private
      def generate_token(column)
        begin 
          self[column]=SecureRandom.urlsafe_base64
        end while User.exists?(column => self[column])
      end
end

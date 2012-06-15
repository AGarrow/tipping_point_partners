class User < ActiveRecord::Base
  belongs_to :company
  attr_accessible :name, :email, :avatar, :password, 
  :password_confirmation, :company_id, :phone, :print_code, :role
  attr_accessor :updating_password 
  
  has_secure_password
  
  ROLES = %w[admin company_admin employee ]

    
     
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
    validates :password, presence: true, length: { minimum: 6 }, :if => :should_validate_password?
    validates :password_confirmation,:company_id, presence: true , :if => :should_validate_password?

   


#for authorization using CanCan
    
    def is? (string)
      string == (self.role)
    end

#for editing user profiles and resetting passwords    

    def should_validate_password?
      updating_password || new_record?
    end

    def send_password_reset
      generate_token(:password_reset_token)
      self.password_reset_sent_at = Time.zone.now
      save!
      UserMailer.password_reset(self).deliver
    end
  
    private
      def generate_token(column)
        begin 
          self[column]=SecureRandom.urlsafe_base64
        end while User.exists?(column => self[column])
      end
end

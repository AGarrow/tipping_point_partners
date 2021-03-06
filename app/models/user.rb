class User < ActiveRecord::Base
  belongs_to :company
  attr_accessible :first_name,:last_name, :email, :avatar, :password, 
  :password_confirmation, :company_id, :phone, :print_code, :role, :atoken, :asecret, :admin_added
  attr_accessor :updating_password, :admin_added

  has_secure_password 
  has_attached_file :avatar, 
  :styles => {
    :thumb => "100x100#",
    :small => "150x150#"
    },
    :storage => :s3,
    :s3_credentials => "config/s3.yml",
    :path => "/:style/:id/:filename"
  ROLES = %w[admin company_admin employee]

   before_validation do |user|
     user.email = email.downcase
   end

   before_validation :on => :create do |user|
    if admin_added?
      create_by_admin
    else
      assign_company
    end  
   end

   before_create do |user|
     generate_token(:remember_token)
     send_validation unless admin_added?    
   end 
   
   before_save do |user| 
      user.email = email.downcase 
      user.first_name=first_name.titleize
      user.last_name=last_name.titleize
   end
   
   

  
   
    validates :first_name,:last_name, presence: true, length: { maximum: 20 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence:   true,
                      format:     { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive:  false }
    validates :password, presence: true, length: { minimum: 6 }, :if => :should_validate_password? 
    validates :password_confirmation, presence: true , :if => :should_validate_password?
    validates :company_id, presence: true
   


    def assign_company
      split_email = self.email.to_s.partition"@"
      if extension = split_email[2]
        self.company = Company.find_by_email_extension(extension) 
      end     
    end

    def create_by_admin
      generate_token(:validation_token)
      self.validation_sent_at = Time.zone.now
      password = Array.new(32){rand(36).to_s(36)}.join
      self.password = password
      UserMailer.claim_account(self, password).deliver      
    end



#for authorization using CanCan
    
    def is? (string)
      string == (self.role)
    end

    def admin_added?
      !admin_added.nil?
    end

#for editing user profiles and resetting passwords 
   def send_validation 
     generate_token(:validation_token)
     self.validation_sent_at = Time.zone.now
     UserMailer.registration_confirmation(self).deliver
   end

    def should_validate_password?
      unless admin_added?
        updating_password || new_record? 
      else
        false
      end
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

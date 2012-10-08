require "spec_helper"

describe AnnouncementMailer do
	private

		def read_fixture(action)
			IO.readlines("#{FIXTURES_PATH}/mailers/user_mailer/#{action}")
		end






  pending "add some examples to (or delete) #{__FILE__}"
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

	def render_api
		{
			id: self.id,
			created_at: self.created_at,
			firstname: self.firstname,
			lastname: self.lastname,
			email: self.email,
			section: self.section,
			birthday_date: self.birthday_date
		}
	end

end

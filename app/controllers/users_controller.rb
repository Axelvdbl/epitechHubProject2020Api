class UsersController < BaseController

	def index
		@users = User.all
		render :json => array_serializer(@users)
	end

	def show
		@user = User.find_by_id(params[:id])
		return render :json => [] unless !@user.blank?
		render :json => @user.render_api
	end

	def create
		@user = User.new(permitted_params)
		return render :json => [] unless @user.save
		render(
			json: @user.render_api,
			status: 201,
			location: user_path(@user.id)
		)
	end

	def update
		@user = User.find_by_id(params[:id])
		return render :json => [] unless @user.update_attributes(permitted_params)
		render(
			json: @user.render_api,
			status: 201,
			location: user_path(@user.id)
		)
	end

	def destroy
		@user = User.find(params[:id]);
		@user.archived = true;
		return render :json => [] unless @user.save
		render(
			json: @user.render_api,
			status: 201,
			location: user_path(@user.id)
		)
	end

	private

	def permitted_params
		params.require(:user).permit(
			:email,
			:firstname,
			:lastname,
			:phone_number,
			:section,
			:birthday_date,
			:profile_picture
		)
	end

	def array_serializer users
		users_serialized = Array.new
		users.each do |user|
			users_serialized.push(user.render_api)
		end
		users_serialized
	end

end

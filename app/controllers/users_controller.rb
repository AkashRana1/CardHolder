class UsersController < ApplicationController
	def new
		redirect_to user_path(current_user.id) if current_user.present?
		@user = User.new
	end
	def show
		redirect_to root_path unless current_user.present?
		@account = current_user.bank_accounts.first if current_user.bank_accounts
	end
	def bank_create
		user_update
		account_params
		@user = current_user
		if @user.update(@user_date)
			@user.bank_accounts.create(@account)
			flash[:notice] = "Account Details filled up!"
		end
		redirect_to root_path
	end
	def create
		@user = User.new(user_params)
		begin
		if @user.save
		 flash[:notice] = "User created."
		 redirect_to root_path
		else
		 render 'new'
		end
		rescue StandardError => e
		 flash[:alert] = "User already exist!"
		 redirect_to root_path
		end
	end

	private
	def account_params
		@account = params.permit(:account_number,:ifsc_code,:swift_number)
	end
	def user_update
		@user_date = params.permit(:first_name,:last_name,:phone)
	end
	def user_params
		params.require(:user).permit(:email, :password)
	end
end

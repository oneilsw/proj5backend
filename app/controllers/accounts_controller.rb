class AccountsController < ApplicationController
   
   def create
      account = Account.create(account_params)
      if account.valid?
         render json: {token: token(account.id), account_id: account.id, user: account.user, user_type: account.user_type}
      else
         render json: {error: account.errors.full_messages}, status: :unprocessable_entity
      end
   end 

   def index
      accounts = Account.all
      render json: accounts
   end 

   def show
      account = Account.find(params[:id]) 
      render json: account
   end 

   def update 
      account = Account.find(params[:id])
      account.update(update_account_params)
      if account.valid?
         render json: account
      else
         render json: {errors: account.errors.full_messages}, status: :unprocessable_entity
      end
   end  

   # def convo_participants
   #    account = Account.find(params[:id])
   #    participants = account.participants
   #    render json: participants
   # end 

   private

   def account_params
      params.permit(:email, :password, :user_type, :user_id)
   end 

   def update_account_params
      params.permit(:password)
   end 
end

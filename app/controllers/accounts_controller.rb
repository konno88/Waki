class AccountsController < ApplicationController
    before_action :authenticate_user!

    def show
        @user = User.find(params[:id])
        @currentUserEntry = Entry.where(user_id: current_user.id)
        @userEntry = Entry.where(user_id: @user.id)
        unless @user.id == current_user.id
            @currentUserEntry.each do |cu|
                @userEntry.each do |u|
                    if cu.room_id == u.room_id
                        @isRoom = true
                        @roomId = cu.room_id
                    end
                end
            end
        end

        if @isRoom
        else
            @room = Room.new
            @entry = Entry.new
        end

        if @user == current_user
            redirect_to profile_path
        end
    end

    def index
        @users = User.all
    end
end
class ClubsController < ApplicationController

  def index
    @clubs = Club.order("created_at DESC")
  end

  def new
    @club = Club.new
    @deposit = Deposit.new
  end

  def create
    @club = Club.create(name: params[:club][:name])
    @deposit = Deposit.new(amount: params[:deposit][:amount])
    @deposit.user_id = current_user.id
    @deposit.club_id = @club.id
    @deposit.date = Date.today
    if @deposit.save
      redirect_to user_path(current_user), notice: "Club #{@club.name} created!"
    else
      render 'new'
    end
  end

  def join


  end

  def show
    @club = Club.find(params[:id])
    @deposits = @club.deposits

    @total_invested = 0

    @deposits.each do |d|
      @total_invested += d.amount
    end

    @members = @deposits.collect(&:user).uniq
  end

end

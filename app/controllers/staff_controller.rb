class StaffController < ApplicationController

  before_filter :authenticate_user!

  def index
    @uid_search=Query.uid_search(params[:search])
    @subject_search=Query.subject_search(params[:search], current_user.id)
    @description_search=Query.description_search(params[:search], current_user.id)
       puts "="*25
    puts @description_search
  end

  def unassigned_tickets
    @queries=Query.unassigned
  end

  def open_tickets
    @queries=Query.open(current_user.id)
  end

  def on_hold_tickets
    @queries=Query.on_hold(current_user.id)
  end

  def closed_tickets
    @queries=Query.closed(current_user.id)
  end

end

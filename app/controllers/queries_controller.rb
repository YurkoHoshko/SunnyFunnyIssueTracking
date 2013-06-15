class QueriesController < ApplicationController
  include QueryHelper


  before_filter :authenticate_user!, :only=>[:reply,:reply_update]

  def show
    @query = Query.find(params[:id])
    @changes = @query.changes
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @query }
    end
  end


  def new
    @query = Query.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @query }
    end
  end

  def edit
    @query = Query.find(params[:id])
  end

  def create
    @query = Query.new(params[:query])
    @query.user_id=0
    @status= Status.where("status_name like ?", "Waiting for Staff Response")
    @query.status_id=@status.first.id
    unless Query.last.nil?
    sample_id=Query.last.id
    else
    sample_id=0
    end
    @query.uid=('A'..'Z').to_a.shuffle[0,3].join+"-"+(100000+sample_id+1).to_s
    respond_to do |format|
      if @query.save
        CustomerMailer.new_query_email(@query).deliver
        format.html { redirect_to @query, notice: 'Query was successfully created.' }
        format.json { render json: @query, status: :created, location: @query }
      else
        format.html { render action: "new" }
        format.json { render json: @query.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @query = Query.find(params[:id])


    respond_to do |format|
      if @query.update_attributes(params[:query])
      CustomerMailer.updated_query_email(@query).deliver


        format.html { redirect_to @query, notice: 'Query was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @query.errors, status: :unprocessable_entity }
      end
    end
  end

  def reply
    @query = Query.find(params[:id])
    end

def reply_update

    generate_reply
    respond_to do |format|
      if @query.update_attributes(params[:query])
      CustomerMailer.reply_query_email(@query,@message).deliver


        format.html { redirect_to @query, notice: 'Query was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @query.errors, status: :unprocessable_entity }

    end
  end


end



end

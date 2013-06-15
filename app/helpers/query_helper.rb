module QueryHelper

def generate_reply
     @query = Query.find(params[:id])
    @query.assign_attributes(params[:query])
    @message=[]
    puts "="*25
    if @query.status_id_changed?
      @previous_status=Status.where("id = ?","#{@query.status_id_was}").first
    @message<<"Status changed from #{@previous_status.status_name} to #{@query.status.status_name}</br>"
  end
    if @query.user_id_changed?
      if !@query.user_id=="0"
      @previous_email=User.where("id = ?","#{@query.user_id_was}").first.email
      else
      @previous_email="Nobody"
   end
    @message<<"Responsible person changed from #{@previous_email} to #{@query.user.email}</br>"
  end
  unless params[:query][:replies_attributes]["0"][:reply_description].nil?
    unless params[:query][:replies_attributes]["0"][:reply_description].blank?
      @message<<"Reply: #{params[:query][:replies_attributes]["0"][:reply_description]}</br>"
    end
  end
    @message.each do |msg|
      @change=Change.new
      @change.change_description=msg
      @change.query_id=@query.id
      @change.save
    end
  end

end

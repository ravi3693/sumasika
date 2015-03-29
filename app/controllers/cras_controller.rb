class CrasController < ApplicationController
  def index

    @user = my_session unless my_session.nil?
    @about = Aboutconttent.find_by_id(11)
    @expert = Expert.all
    @members = User.count
    @trusted=Trusted.all
    
    
  end

  def howitworks

  end

  def aboutus
  	
  end


  def tandc
    
  end

  def privacy
    
  end



  def contactus
	Reguser.contact_email(params).deliver_now
	Reguser.support_email(params).deliver_now
	redirect_to root_url , :alert => "Mail send sucessfully"
  end
end

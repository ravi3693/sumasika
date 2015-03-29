class AdminsController < ApplicationController
	before_action :checkuser
  before_action :checkadmin

  def index
    
  end

  def past
  	@details = Synthesize.find_by_status('complete')
  	if @details.class == Synthesize
  		@details = [@details] 
  	end
  end

  def show
  	@detail = Synthesize.find(params[:id])
  end

  def activation
    @memberdetails=Manager.where("active=?",false)
  end

  def approved
    if !params[:uid].nil?
      @details=Manager.find_by_id(params[:uid])
      @active=Manager.find_by_id(params[:uid]).update(:active => 'true')
      if @active
        redirect_to admin_activation_path, :flash => { :error => "#{@details.first_name} Activated sucessfully" }
      end
    end
  end

  def pending
  	@details = Synthesize.where('status=?','charged')
  	if @details.class == Synthesize
  		@details = [@details] 
  	end
  end

  def approve
    @syn = Synthesize.find(params[:baser])
    @syn.status = "complete"
    redirect_to admin_past_path if @syn.save
  end

  def aboutsumasika
    @aboutsumasika=Aboutconttent.all
  end

  def addaboutsumasika
    @aboutconntent=Aboutconttent.new()
  end

  def create
    
    @About_conttent=Aboutconttent.new(req_params)
    
    if @About_conttent.save
      
      flash[:notice] = "Added Sucessfully"
      
      redirect_to admin_aboutsumasika_path
    end
  end

  def delete
    @delete=Aboutconttent.destroy(params[:id])

    if @delete
      flash[:notice] = "One Record Deleted Sucessfully"
      redirect_to admin_aboutsumasika_path
    end
  end

  def aboutsumasikaedit
    @aboutsumasikaedit=Aboutconttent.find_by_id(params[:id])
  end

  def editcreate
    
    @editcreate=Aboutconttent.find_by_id(params[:aboutconttent][:id]).update(:content => params[:aboutconttent][:content],:titleone => params[:aboutconttent][:titleone],:titletwo => params[:aboutconttent][:titletwo],:titlethree => params[:aboutconttent][:titlethree])
    if @editcreate
        Aboutconttent.find_by_id(params[:aboutconttent][:id]).update(:image => params[:aboutconttent][:image]) unless params[:aboutconttent][:image].nil?
        redirect_to admin_aboutsumasika_path
    end
  
 end
 def addexperts
    @addexperts=Expert.new()
  end

  def expertcreate

    @expert=Expert.new(req_expertparams)
    if @expert.save
      flash[:notice]="Experts Added Sucessfully"
      redirect_to admin_experts_path
    end
  end

  def experts

    @allexperts=Expert.all
    
  end
  def editexpert
    @expert= Expert.find(params[:id])
  end
  def expertedit
    @expertedit=Expert.find(params[:expert][:id]).update(:name =>params[:expert][:name] ,:designation =>params[:expert][:designation],:description =>params[:expert][:description])
    if @expertedit
      Expert.find(params[:expert][:id]).update(:image =>params[:expert][:image]) unless params[:expert][:image].nil?
      redirect_to admin_experts_path
    end
  end
  def expertdel
    @expertdel=Expert.destroy(params[:id])
    
    if @expertdel
      redirect_to admin_experts_path
    end
  end

  def trusted
    @trusted= Trusted.all   

  end

  def addtrusted

     @trusted= Trusted.new()   

  end

  def trustcreate
    
    @trusted=Trusted.new(req_trustparams)
    if @trusted.save
      redirect_to admins_trusted_path
     end
  end
  def trustupdate
    
      @trustupdate=Trusted.find(params[:id]).update(:name => params[:trusted][:name],:description => params[:trusted][:description],:company => params[:trusted][:company],:rating => params[:trusted][:rating])   
      if @trustupdate
        redirect_to admins_trusted_path
      end
  end
  def edittrusted
    @trusted=Trusted.find(params[:id])  
  end
  def trustdel
    @trusted=Trusted.destroy(params[:id])  
    
    if @trusted
      redirect_to admins_trusted_path
    end
  end

  private
  def req_params

    params.require(:aboutconttent).permit(:content,:titleone,:titletwo,:titlethree,:image)

  end
  def req_expertparams
     params.require(:expert).permit(:name,:designation,:description,:image)    
  end
  def req_trustparams
    params.require(:trusted).permit(:name,:description,:company,:rating)    
  end

end

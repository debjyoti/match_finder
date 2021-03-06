class ProfilesController < ApplicationController
  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.order("created_at DESC")

    if user_signed_in? and current_user.profile then
      @recent_pings = current_user.profile.pings.where("created_at >= ?", current_user.last_sign_in_at).order("created_at DESC")
      @all_ping_count = current_user.profile.pings.count
      @who_i_pinged_count = Ping.where(from_profile_id: current_user.profile.id).count
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profiles }
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = Profile.find(params[:id] )
    @answers = @profile.answers.order(:id)
    @age = ((DateTime.now.to_date - @profile.born).to_i / 365)
    @him_or_her = @profile.gender=='male'? 'Him' : 'Her'

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end

  def ping
    if user_signed_in? then
      if current_user.profile then
        @profile = Profile.find(params[:profile_id])
        @profile.pings.create(from_profile_id: current_user.profile.id, msg: params[:msg], email: current_user.email, pinger_name: current_user.profile.name, pinged_name: @profile.name)
        PingMailer.ping_email(@profile.user.email, current_user.profile.name, params[:msg], current_user.email, profile_url(@profile, host: "www.gettoknowyou.in")).deliver
        redirect_to :back, notice: "#{@profile.name} has been notified about your ping."
      else
        redirect_to new_profile_path, notice: 'You must have a profile before you ping.'
      end
    else
      redirect_to new_user_session_path, notice: 'You must sign in to ping.'
    end
  end

  def older_pings
    @older_pings = current_user.profile.pings.where("created_at < ?", current_user.last_sign_in_at).order("created_at DESC")
    respond_to do |format|
      format.js 
    end
  end

  def see_who_i_pinged
    @who_i_pinged = Ping.where(from_profile_id: current_user.profile.id).order("created_at DESC")
    respond_to do |format|
      format.js
    end
  end

  # GET /profiles/new
  # GET /profiles/new.json
  def new
    @profile = current_user.build_profile
    @profile.web_links.new()
    @questions = Question.all(include: :options)
    @questions.each do |qs|
      @profile.answers.new(question_id: qs.id, question_text: qs.question)
    end
    @index=0

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
    @profile = current_user.profile
    @answers = @profile.answers
    @index=0
  end

  # POST /profiles
  # POST /profiles.json
  def create

    set_option_text_in_param
    @profile = current_user.build_profile(params[:profile])

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render json: @profile, status: :created, location: @profile }
      else
        @questions = Question.all(include: :options)
        @index=0
        format.html { render action: "new" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update

    set_option_text_in_param
    @profile = current_user.profile

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        @questions = Question.all(include: :options)
        @index=0
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile = current_user.profile
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end

  private

  def set_option_text_in_param
    #This seems to be inefficient. I am querying the database several times.
    #I tried passing both the id and value (concatenated) in the radio-button
    #value field. Create works, but edit form does not show selected buttons.
    #There must be better way. Maybe I should use javascript to add the text
    #as a hidden field and do away with this stupid method.
    #Even better, use VIRTUAL ATTRIBUTES

    params['profile']['answers_attributes'].keys.each do |indx|
      option_id = params['profile']['answers_attributes'][indx]['option_id']
      if(option_id) then
        option_text = Option.find(option_id, select: :option)[:option]
        params['profile']['answers_attributes'][indx][:chosen_option] = option_text
      end
    end
  end

end

class AttendancesController < ApplicationController
  # GET /attendances
  # GET /attendances.json
  before_filter :get_attendes, :only =>[:create, :new]
  def index
    @attendances = Attendance.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attendances }
    end
  end

  # GET /attendances/new
  # GET /attendances/new.json
  def new
    @attendance = Attendance.new
    #raise @attendable.inspect
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attendance }
    end
  end

  # GET /attendances/1/edit
  def edit
    @attendance = Attendance.find(params[:id])
  end

  # POST /attendances
  # POST /attendances.json
  def create
    #raise @attendable.inspect
    @attendance = @attendable.attendances.new(params[:attendance])

    #respond_to do |format|
      if @attendance.save
        redirect_to attendances_path, notice: 'Attendance was successfully created.'
        
      else
#        format.html { render action: "new" }
#        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    #end
  end

  # PUT /attendances/1
  # PUT /attendances/1.json
  def update
    @attendance = Attendance.find(params[:id])

    respond_to do |format|
      if @attendance.update_attributes(params[:attendance])
        format.html { redirect_to @attendance, notice: 'Attendance was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy

    respond_to do |format|
      format.html { redirect_to attendances_url }
      format.json { head :ok }
    end
  end

end

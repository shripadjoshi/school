class StudentsController < ApplicationController
  # GET /students
  # GET /students.json
  def index
    @students = Student.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
      format.xml { render xml: @students }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
      format.xml { render xml: @student }
    end
  end

  # GET /students/new
  # GET /students/new.json
  def new
    @student = Student.new
    @classrooms = Classroom.all
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
      format.xml { render xml: @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
    @classrooms = Classroom.all
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render json: @student, status: :created, location: @student }
        format.xml { render xml: @student, status: :created, location: @student }
      else
        @classrooms = Classroom.all
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
        format.xml { render xml: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :ok }
        format.xml { head :ok }
      else
        @classrooms = Classroom.all
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
        format.xml { render xml: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :ok }
      format.xml { head :ok }
    end
  end
  
  def activate
    state = Student.find(params[:id])
    state.update_attribute('active', !state.active)
    @students = Student.all
    redirect_to students_path
  end  
  
end

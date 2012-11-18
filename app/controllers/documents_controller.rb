class DocumentsController < ApplicationController
  
  before_filter :is_authenticated
  before_filter :is_admin,:except => [:new,:create,:success ]

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
p @documents
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @documents }
    end
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    @document = Document.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document }
    end
  end

  # GET /documents/new
  # GET /documents/new.json
  def new
    @author = Author.find_by_facebookuid(session[:fbuser]['id'])
    @author = Author.new if @author == nil
    @document = Document.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @document }
    end
  end

  # GET /documents/1/edit
  def edit
    @document = Document.find(params[:id])
    @author = @document.author
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(params[:document])
    @document.approved = false
    @author = Author.find_by_facebookuid(session[:fbuser]['id'])
    
    if @author == nil then
      @author = Author.new(params[:author])
      @author.facebookuid = session[:fbuser]['id']
      @author.name = session[:fbuser]['name']
    else 
      @author.update_attributes(params[:author])
    end
    
      @document.author = @author

    respond_to do |format|
      if @document.save
  
        
        format.html { redirect_to success_documents_url, notice: 'Document was successfully created.' }
        format.json { render json: @document, status: :created, location: @document }
        
      else
        format.html { render action: "new" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end
  
  

  # PUT /documents/1
  # PUT /documents/1.json
  def update
    @document = Document.find(params[:id])

    respond_to do |format|
      if @document.update_attributes(params[:document]) and @document.author.update_attributes(params[:author])
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def success
  end
  

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document = Document.find(params[:id])
    @document.destroy

    respond_to do |format|
      format.html { redirect_to documents_url }
      format.json { head :no_content }
    end
  end
end

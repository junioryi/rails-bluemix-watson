class IdeasController < ApplicationController
  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ideas }
    end
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @idea = Idea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @idea }
    end
  end

  # GET /ideas/new
  # GET /ideas/new.json
  def new
    @idea = Idea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @idea }
    end
  end

  # GET /ideas/1/edit
  def edit
    @idea = Idea.find(params[:id])
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(params[:idea])

    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render json: @idea, status: :created, location: @idea }
      else
        format.html { render action: "new" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ideas/1
  # PUT /ideas/1.json
  def update
    @idea = Idea.find(params[:id])

    respond_to do |format|
      if @idea.update_attributes(params[:idea])
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy

    respond_to do |format|
      format.html { redirect_to ideas_url }
      format.json { head :no_content }
    end
  end

  # GET /ideas/getKey/1
  def getkey
    require './alchemyapi'
    alchemyapi = AlchemyAPI.new()

    @idea = Idea.find(params[:id])

    image_file = File.binread("public#{@idea.picture_url}")
    response = alchemyapi.image_tag('image', '', { 'imagePostMode'=>'raw'}, image_file)

    puts '###### result from alchemyapi ######'
    puts response['status']
    puts ''
    if response.key?('imageKeywords')
        puts 'Keywords:'
        @i = 1
        for keyword in response['imageKeywords']
            puts "\ttext: " + keyword['text']
            puts "\tscore: " + keyword['score']
            if @i == 1 
                @idea.attributes = ({ :keyword1 => keyword['text'], :score1 => keyword['score'] })
            end
            if @i == 2 
                @idea.attributes = ({ :keyword2 => keyword['text'], :score2 => keyword['score'] })
            end
            @i += 1
        end
        @idea.save
    end
    puts '####################################'
    puts ''
    
    
    respond_to do |format|
      format.html # getkey.html.erb
    end
  end
end











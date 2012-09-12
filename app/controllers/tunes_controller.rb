class TunesController < ApplicationController
  require 'soundcloud'
  
  
  # GET /tunes
  # GET /tunes.json
  def index
    @tunes = Tune.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tunes }
    end
  end

  # GET /tunes/1
  # GET /tunes/1.json
  def show
    @tune = Tune.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tune }
    end
  end

  # GET /tunes/new
  # GET /tunes/new.json
  def new
    @tune = Tune.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tune }
    end
  end

  # GET /tunes/1/edit
  def edit
    @tune = Tune.find(params[:id])
  end

  # POST /tunes
  # POST /tunes.json
  def create
    @tune = Tune.new(params[:tune])

    respond_to do |format|
      if @tune.save
        format.html { redirect_to @tune, notice: 'Tune was successfully created.' }
        format.json { render json: @tune, status: :created, location: @tune }
      else
        format.html { render action: "new" }
        format.json { render json: @tune.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tunes/1
  # PUT /tunes/1.json
  def update
    @tune = Tune.find(params[:id])

    respond_to do |format|
      if @tune.update_attributes(params[:tune])
        format.html { redirect_to @tune, notice: 'Tune was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tune.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tunes/1
  # DELETE /tunes/1.json
  def destroy
    @tune = Tune.find(params[:id])
    @tune.destroy

    respond_to do |format|
      format.html { redirect_to tunes_url }
      format.json { head :no_content }
    end
  end
  
  
  def soundcloud

    # create a client object with your app credentials
    
    client = Soundcloud.new(:client_id => 'f2334dc770efb325207e4eb621703422')

    # find all sounds of buskers licensed under 'creative commons share alike'
    # try to get a track
    
    begin
      @tracks = client.get('/tracks', :q => params[:q], :limit => 5)
      @results = []
      for t in @tracks
        if t.streamable
          # embed = client.get('/oembed', :url => t.permalink_url)
          # @results.push embed['html']
          @results.push t.uri
          puts "getting"
        end
      end
      puts @results
    rescue Soundcloud::ResponseError => e
      puts "Error: #{e.message}, Status Code: #{e.response.code}"
    end
    
  end
  
end

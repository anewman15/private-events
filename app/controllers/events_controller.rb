class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :new]

  # GET /events
  # GET /events.json
  def index
    @event = Event.new
    @upcoming_events = Event.upcoming_events.order('created_at DESC')
    @past_events = Event.past_events.order('created_at DESC')
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @event_attendees = Event.find(params[:id]).attendees
  end

  # GET /events/new
  def new
    @event = Event.new
    redirect_to root_path
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = current_user.created_events.build(event_params)
    @upcoming_events = Event.upcoming_events.order('created_at DESC')
    @past_events = Event.past_events.order('created_at DESC')
    
    respond_to do |format|
      if @event.save
        format.html { redirect_to event_path, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :index, alert: 'Event was not created. Please try again!' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:event_name, :event_location, :event_date, :description)
    end
end

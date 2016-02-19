class EventTypsController < ApplicationController
  before_action :set_event_typ, only: [:show, :edit, :update, :destroy]

  # GET /event_typs
  # GET /event_typs.json
  def index
    @event_typs = EventTyp.all
  end

  # GET /event_typs/1
  # GET /event_typs/1.json
  def show
  end

  # GET /event_typs/new
  def new
    @event_typ = EventTyp.new
  end

  # GET /event_typs/1/edit
  def edit
  end

  # POST /event_typs
  # POST /event_typs.json
  def create
    @event_typ = EventTyp.new(event_typ_params)

    respond_to do |format|
      if @event_typ.save
        format.html { redirect_to @event_typ, notice: 'Event typ was successfully created.' }
        format.json { render :show, status: :created, location: @event_typ }
      else
        format.html { render :new }
        format.json { render json: @event_typ.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_typs/1
  # PATCH/PUT /event_typs/1.json
  def update
    respond_to do |format|
      if @event_typ.update(event_typ_params)
        format.html { redirect_to @event_typ, notice: 'Event typ was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_typ }
      else
        format.html { render :edit }
        format.json { render json: @event_typ.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_typs/1
  # DELETE /event_typs/1.json
  def destroy
    @event_typ.destroy
    respond_to do |format|
      format.html { redirect_to event_typs_url, notice: 'Event typ was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_typ
      @event_typ = EventTyp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_typ_params
      params.require(:event_typ).permit(:name)
    end
end

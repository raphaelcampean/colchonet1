class RoomsController < ApplicationController
  PER_PAGE = 10
  before_action :set_room, only: %i[ show edit update destroy ]
  before_action :require_authentication, only: [:new, :edit, :create, :update, :destroy]

  def index
    @search_query = params[:q]
    
    # O método #map, de coleções, retornará um novo Array
    # contendo o resultado do bloco. Dessa forma, para cada
    # quarto, retornaremos o presenter equivalente.
    @rooms = Room.most_recent.map do |room|
    # Não exibiremos o formulário na listagem
      RoomPresenter.new(room, self, false)
    end
  end
  
  def show
    room_model = Room.friendly.find(params[:id])
    @room = RoomPresenter.new(room_model, self)
  end
      
  def new
    @room = current_user.rooms.build
  end

  def edit
    @room = current_user.rooms.friendly.find(params[:id])
  end

  def create
    @room = current_user.rooms.build(room_params)
  
    if @room.save
      redirect_to @room, notice: t('flash.notice.room_created')
    else
      render action: "new"
    end
  end


  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    @room = current_user.rooms.friendly.find(params[:id])
    
    if @room.update(room_params)
    redirect_to @room, notice: t('flash.notice.room_updated')
    else
    render action: "edit"
    end
  end

  def destroy
    @room = current_user.rooms.find(params[:id])
    @room.destroy
    redirect_to rooms_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:title, :location, :description, :picture)
    end
end

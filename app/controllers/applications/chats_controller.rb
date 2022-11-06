class Applications::ChatsController < Applications::BaseController
  before_action :set_application
  before_action :set_chat, only: [:show]

  # GET /applications/:application_token/chats
  def index
    @chats = @application.chats

    paginate collection: @chats
  end

  # GET /applications/:application_token/chats/1
  def show
    render json: @chat
  end

  # POST /applications/:application_token/chats
  def create
    @chat = @application.chats.new

    if @chat.save
      render json: @chat, status: :created
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
    rescue ActiveRecord::RecordNotUnique
      render json: { error: I18n.t('controllers.errors.uniqueness') }, status: :unprocessable_entity 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = @application.chats.find_by_chat_number!(params[:number])
    end
end

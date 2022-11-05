class Applications::ChatsController < Applications::BaseController
  before_action :set_application
  before_action :set_chat, only: [:show]

  # GET /applications/:application_token/chats
  def index
    @applications_chats = @application.chats

    paginate collection: @applications_chats
  end

  # GET /applications/:application_token/chats/1
  def show
    render json: @applications_chat
  end

  # POST /applications/:application_token/chats
  def create
    @applications_chat = @application.chats.new

    if @applications_chat.save
      render json: @applications_chat, status: :created
    else
      render json: @applications_chat.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @applications_chat = @application.chats.find_by_chat_number!(params[:number])
    end
end

class ResponsesController < ApplicationController
  before_action :set_response, only: [:show, :edit, :update, :destroy]

  # GET /responses
  # GET /responses.json
  def index
    @responses = Response.all
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
    #N.B. that @question is the _next_ question in the sequence.
    @question = current_user.questions.new
    @question.type = "Question"
    @question.section_id = 1
    @question.save
    current_user.current_question = current_user.current_question + 1
  end

  # # GET /responses/new
  # def new
  #   @response = Response.new
  # end
  #

  # POST /responses
  # POST /responses.json
  def create
    @response = Response.new(response_params)

    @question = Question.find(params[:question_id])
    @question.response = @response

    respond_to do |format|
      if @response.save
        format.html { redirect_to @response, notice: 'Response was successfully created.' }
        format.json { render :show, status: :created, location: @response }
      else
        format.html { render :new }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = Response.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
      params.require(:response).permit(:type, :section_id, :sequence_id, :question_id)
    end
end

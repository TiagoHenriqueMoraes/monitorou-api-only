class Api::V1::ContentsController < Api::V1::ApiController
  before_action :set_content, only: %i[destroy update]
  before_action :authorize_user, only: %i[update destroy create]
  
  def index
    @contents = apply_scopes(Content).all
    render json: @contents, except: %i[created_at updated_at], include: { study_group: { only: %i[name theme], include:{
                                                                          subject: { only: %i[name] } } } }
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      render json: @content
    else
      render json: @content.errors, status: :unprocessable_entity
    end
  end

  def update
    if @content.update(content_params)
      render json: @content
    else
      render json: @content.errors
    end
  end
  
  def destroy
    @content.destroy
  end

  private

  def set_content
    @content = Content.find(params[:id])
  end

  def authorize_user
    authorize Content
  end

  def content_params
    params.require(:content).permit(:kind, :image, :document, :file_url, :study_group_id, :description)
  end
end

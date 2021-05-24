class ContentsController < ApplicationController
  before_action :force_json, only: :search

  def search
    input = params[:name]
    @contents = Content.where("name_jpn ILIKE ? OR name ILIKE ? OR name_kana ILIKE ?", "%#{input}%", "%#{input}%", "%#{input}%").limit(20)
  end
  
  private

  def force_json
    request.format = :json
  end
end

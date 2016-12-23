class CrunchesController < ApplicationController
  require 'open-uri'

  # respond_to :json

  swagger_controller :crunches, 'Crunches'

  swagger_api :index do
    summary 'Returns all saved data'
    notes 'Notes...'
  end
  
  # GET /crunches
  def index
    render json: JSON.pretty_generate(JSON.parse(Crunch.all.pluck(:data_url, :tag_content).to_json))
  end

  swagger_api :crunch do
    summary 'Crunch tag data from given url'
    notes 'uses Nokogiri to extract data from given url'
    param "query", "data_url", "string", "required", "URL to crunch"
  end
  def crunch
    data_url = params[:data_url]
    unless data_url.include?('http')
      data_url = "http://#{data_url}"
    end

    page = Nokogiri::HTML(open(URI.parse(data_url)))
    content = page.css('h1, h2, h3').map(&:text).join(" ")
    content.gsub!(/\r\n?/, "\n")
    @crunch = Crunch.new(data_url: data_url, tag_content: content)
    
    if @crunch.save
      redirect_to root_url
    else
      render json: @crunch.errors, status: :unprocessable_entity
    end

  end

  private
    # Only allow a trusted parameter "white list" through.
    def crunch_params
      params.require(:crunch).permit(:data_url, :tag_content, :a_tag_url)
    end
end
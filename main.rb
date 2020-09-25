require 'json'

require_relative './robots/input.rb'
require_relative './robots/starwars.rb'
require_relative './robots/images.rb'

class Application
    include Input
    include SWRobot
    include Images
    attr_accessor :content

    def initialize
        name = get_name()
        type = get_type()

        @content = get_info(name, type)
        @content = @content.merge({
            photo_url: get_image_by_name(@content[:full_name])
        })

        puts @content
    end
end

Application.new()
require 'json'

require_relative './robots/input.rb'
require_relative './robots/starwars.rb'

class Application
    include Input
    include SWRobot

    attr_accessor :content

    def initialize
        name = get_name()
        type = get_type()

        @content = get_info(name, type)
        puts @content
    end
end

Application.new()
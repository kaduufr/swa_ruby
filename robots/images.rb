require_relative '../credentials/google-search.rb'

module Images
    def get_image_by_name name
        goo = URI.open("https://www.googleapis.com/customsearch/v1?key=#{API_KEY}&cx=#{CSE_API}&q=#{name} star wars&searchTipe='image'").read
        data_parsed = JSON.parse(goo)
        
        image_url = data_parsed['items'][0]['pagemap']['cse_image'][0]['src']
    end
end
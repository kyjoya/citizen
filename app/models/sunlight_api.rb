class SunlightAPI
  def sunlight_api_call(params)
    url = "http://www.capitolwords.org/api/1/phrases/state.json?phrase=#{params}&page=0&per_page=50&sort=count&apikey=#{ENV["SUNLIGHT_KEY"]}"
    @sunlight_info = HTTParty.get(url)
  end
end

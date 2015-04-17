class CivicAPI
  def civic_api_call(params)
    url = "https://www.googleapis.com/civicinfo/v2/representatives?key=AIzaSyARLN3nYqMLMZh-7AqR5LJH-3YA-lCrFR8&address=#{params}"
    uri = URI.parse(url)
    @state_info = JSON.parse(Net::HTTP.get(uri))
  end
end

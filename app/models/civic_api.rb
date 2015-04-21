class CivicAPI
  def civic_api_call(params)
    if params.include?(" ")
      params = params.delete(' ')
      url = "https://www.googleapis.com/civicinfo/v2/representatives?key=#{ENV["GOOGLE_KEY"]}&address=#{params}"
    else
      url = "https://www.googleapis.com/civicinfo/v2/representatives?key=#{ENV["GOOGLE_KEY"]}&address=#{params}"
    end

    uri = URI.parse(url)
    @state_info = JSON.parse(Net::HTTP.get(uri))
  end
end

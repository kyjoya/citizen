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

    parse(@state_info)
  end

  def parse(state_info)
      rep = []
      info = {}
      counter = 0
    state_info["officials"].each do |official|
        info["name"] = official["name"]
        if official["address"]
          info["address1"] = official["address"][0]["line1"]
          info["address2"] = official["address"][0]["line2"]
          info["city"] = official["address"][0]["city"].capitalize
          info["state"] = official["address"][0]["state"]
          info["zip"] = official["address"][0]["zip"]
        end
        info["party"] = official["party"]

        unless official["phones"].nil?
          info["phones"] = official["phones"].join
        end

        unless official["urls"].nil?
          info["url"] = official["urls"].join
        end

        info["index"] = counter

        info.delete_if {|k,v| v == nil}
        rep.push(info.dup)
        counter += 1
    end
      return rep
  end
end

class PetitionsController < ApplicationController
  def index
    @petitions = Petition.limit(10)
  end

  def create

  end

  def show

  end
end

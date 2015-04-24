class StateWordCountSerializer < ActiveModel::Serializer
  attributes :word_count_information

  def word_count_information
     {object.word => object.count}
 end
end

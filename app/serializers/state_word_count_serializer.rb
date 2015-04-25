class StateWordCountSerializer < ActiveModel::Serializer
  attributes :word, :count
end

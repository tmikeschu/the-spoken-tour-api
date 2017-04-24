class SuggestionPinSerializer < ActiveModel::Serializer
  attributes :id, :label, :location, :description, :category

  def location
    {
      lat: object.lat,
      lng: object.lng
    }
  end
end

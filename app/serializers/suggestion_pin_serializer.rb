class SuggestionPinSerializer < ActiveModel::Serializer
  attributes :id, :label, :location, :description, :message, :category

  def location
    {
      lat: object.lat,
      lng: object.lng
    }
  end
end

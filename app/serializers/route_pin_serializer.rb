class RoutePinSerializer < ActiveModel::Serializer
  attributes :location

  def location
    {
      lat: object.lat,
      lng: object.lng
    }
  end
end

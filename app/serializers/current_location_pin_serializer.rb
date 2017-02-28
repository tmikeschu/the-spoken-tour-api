class CurrentLocationPinSerializer < ActiveModel::Serializer
  attributes :id, :location, :date

  def location
    {
      lat: object.lat,
      lng: object.lng
    }
  end

  def date
    object.updated_at.to_formatted_s(:long)
  end
end

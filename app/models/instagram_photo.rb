class InstagramPhoto
  def self.all
    InstagramService.get_photos
  end
end

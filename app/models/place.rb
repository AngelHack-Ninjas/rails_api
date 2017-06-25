class Place < ApplicationRecord
  has_many :hours

  def is_happy?
    day = Time.now().strftime('%a').downcase
    total_minutes = (Time.now.hour * 60 + Time.now.min)
    self.hours.each do |hour|
      if hour['day'] == day
        if hour['start'] * 60 < total_minutes && total_minutes < hour['stop'] * 60
          return true
        end
      end
      return false
    end
  end

  def get_distance(user)
    r = 6371
    delt_lat = (user[:lat].to_i - self.lat) * Math::PI / 180
    delt_long = (user[:long].to_i - self.long) * Math::PI / 180
    a = Math.sin(delt_lat/2) * Math.sin(delt_lat/2) + Math.cos(user[:lat].to_i * Math::PI / 180 ) * Math.cos(self.lat * Math::PI / 180) * Math.sin(delt_long/2) * Math.sin(delt_long / 2)
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
    d = r * c
  end
end

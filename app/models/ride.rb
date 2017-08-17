class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    messages = ["Sorry."]
    messages << "You do not have enough tickets to ride the #{self.attraction.name}." if self.user.tickets < self.attraction.tickets
    messages << "You are not tall enough to ride the #{self.attraction.name}." if self.user.height < self.attraction.min_height

    return update_users_attributes if messages.length == 1

    messages = messages.join(" ")
    self.errors.add :ride, messages
    messages
  end

  def update_users_attributes
    self.user.tickets -= self.attraction.tickets
    self.user.nausea += self.attraction.nausea_rating
    self.user.happiness += self.attraction.happiness_rating
    self.user.save
  end
end

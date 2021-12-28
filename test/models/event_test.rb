require "test_helper"

class EventTest < ActiveSupport::TestCase
  test "valid event" do
    usr = User.new(username: "Bobby123", email: "bob321@gmail.com", password: "135792468", password_confirmation: "135792468")
    usr.save
    new_event = Event.new(name: "Fun Run", location: "Central Park", date: "12-12-2021")
    new_event.creator_id = usr.id
    assert new_event.valid?
  end
end

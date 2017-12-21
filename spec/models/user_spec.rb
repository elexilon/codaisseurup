require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "association with registration" do
    let(:guest_user) { create :user, email: "guest@user.com" }
    let(:host_user) { create :user, email: "host@user.com" }

    let!(:event) { create :event, user: host_user }
    let!(:registration) { create :registration, event: event, user: guest_user }

    it "has registrations" do
      expect(guest_user.registration_events).to include(event)
    end
  end
end

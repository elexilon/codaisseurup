require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do
    it "is invalid without name" do
      event = Event.new(name: "")
      event.valid?
      expect(event.errors).to have_key(:name)
    end
    it "is invalid without description" do
      event = Event.new(description: "")
      event.valid?
      expect(event.errors).to have_key(:description)
    end
    it "is invalid without location" do
      event = Event.new(location: "")
      event.valid?
      expect(event.errors).to have_key(:location)
    end
    it "is invalid without price" do
      event = Event.new(price: nil)
      event.valid?
      expect(event.errors).to have_key(:price)
    end
    it "is invalid without capacity" do
      event = Event.new(capacity: nil)
      event.valid?
      expect(event.errors).to have_key(:capacity)
    end
    #it "is invalid without active" do
    #  event = Event.new(active: nil)
    #  event.valid?
    #  expect(event.errors).to have_key(:active)
    #end

    it "is invalid with a name longer than 255 characters"do
      event = Event.new(name: "a"*256)
      event.valid?
      expect(event.errors).to have_key(:name)
    end
    it "is invalid with a location longer than 50 characters"do
      event = Event.new(location: "b"*51)
      event.valid?
      expect(event.errors).to have_key(:location)
    end
    it "is invalid with a description longer than 500 characters"do
      event = Event.new(description: "c"*501)
      event.valid?
      expect(event.errors).to have_key(:description)
    end
    it "is invalid with starts at date is the same or biger than ends at date"do
      event = Event.new(starts_at: DateTime.now, ends_at: DateTime.now )
      event.valid?
      expect(event.errors).to have_key(:starts_at)
    end

  end

  describe "#correct_date?" do
      let(:correct_date) { create :event, starts_at: DateTime.now, ends_at: DateTime.now.next_day(1) }
  #    let(:non_correct_date) { create :event, starts_at: DateTime.now, ends_at: DateTime.now  }

      it "returns true if the date is correct" do
        expect(correct_date.correct_date?).to eq(true)
  #      expect(non_correct_date.correct_date?).to eq(false)
      end
  end

    describe "#bargain?" do
    let(:bargain_event) { create :event, price: 20 }
    let(:non_bargain_event) { create :event, price: 200 }

    it "returns true if the price is smaller than 30 EUR" do
      expect(bargain_event.bargain?).to eq(true)
      expect(non_bargain_event.bargain?).to eq(false)
    end
  end

  describe ".order_by_price" do
    let!(:event1) { create :event, price: 100 }
    let!(:event2) { create :event, price: 200 }
    let!(:event3) { create :event, price: 50 }

    it "returns a sorted array of events by prices" do
      # note that they should not come out in the order that they were created
      expect(Event.order_by_price).to eq([event3, event1, event2])
    end
  end

  describe "association with user" do
    let(:user) { create :user }

    it "belongs to a user" do
      event = user.events.build()

      expect(event.user).to eq(user)
    end
  end


  describe "association with category" do
    let(:event) { create :event }

    let(:category1) { create :category, name: "Bright", events: [event] }
    let(:category2) { create :category, name: "Clean lines", events: [event] }
    let(:category3) { create :category, name: "A Man's Touch", events: [event] }

    it "has categorys" do
      expect(event.categories).to include(category1)
      expect(event.categories).to include(category2)
      expect(event.categories).to include(category3)
    end
  end


    describe "association with booking" do
    let(:guest_user) { create :user, email: "guest@user.com" }
    let(:host_user) { create :user, email: "host@user.com" }

    let!(:event) { create :event, user: host_user }
    let!(:registration) { create :registration, event: event, user: guest_user }

    it "has guests" do
      expect(event.guests).to include(guest_user)
    end
  end

  describe "association with category" do
    let(:event) { create :event }

    let(:category1) { create :category, name: "Bright", events: [event] }
    let(:category2) { create :category, name: "Clean lines", events: [event] }
    let(:category3) { create :category, name: "A Man's Touch", events: [event] }

    it "has categorys" do
      expect(event.categories).to include(category1)
      expect(event.categories).to include(category2)
      expect(event.categories).to include(category3)
    end
  end


  describe "Scope event methods" do
    let!(:event1) { create :event, name: "b", active: true }
    let!(:event2) { create :event, name: "c", active: false }
    let!(:event3) { create :event, name: "a", active: true }

    it "returns a sorted array of events by name" do
      # note that they should not come out in the order that they were created
      expect(Event.order_by_name).to eq([event3, event1, event2])
    end

    it "returns an active events" do
      # note that they should not come out in the order that they were created
      expect(Event.published).to eq([event1, event3])
    end

    it "returns an active events and order by name" do
      # note that they should not come out in the order that they were created
      expect(Event.published.order_by_name).to eq([event3, event1])
    end

  end


end

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
    it "is invalid without active" do
      event = Event.new(active: nil)
      event.valid?
      expect(event.errors).to have_key(:active)
    end

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
  end

  describe "#correct_date?" do
      let(:correct_date) { create :event, starts_at: DateTime.now, ends_at: DateTime.now.next_day(1) }
      let(:non_correct_date) { create :event, starts_at: DateTime.now, ends_at: DateTime.now  }

      it "returns true if the date is correct" do
        expect(correct_date.correct_date?).to eq(true)
        expect(non_correct_date.correct_date?).to eq(false)
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

end

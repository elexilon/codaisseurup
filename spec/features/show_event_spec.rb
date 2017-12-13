require 'rails_helper'

describe "Viewing an individual event" do
  let(:event) { create :event }

  it "shows the event's details" do
    visit event_url(event)

    expect(page).to have_text(event.name)
    expect(page).to have_text(event.description)
    expect(page).to have_text(event.location)
    expect(page).to have_text(event.price)
    expect(page).to have_text("Capacity: #{event.capacity}")
    expect(page).to have_text("Food included: #{event.includes_food}")
    expect(page).to have_text("Drinks included: #{event.includes_drinks}")
    expect(page).to have_text("Status: #{event.active}")
    expect(page).to have_text(event.starts_at)
    expect(page).to have_text(event.ends_at)
  end
end

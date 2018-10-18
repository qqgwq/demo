require "rails_helper"

RSpec.describe "Announcement", type: :request
  it "displays active announcements" do
    Announcement.create! message: "Hello World", starts_at: 1.hour.ago, ends_at: 1.hour.from_now
    Announcement.create! message: "Upcoming", starts_at: 10.minutes.from_now, ends_at: 1.hour.from_now
    visit root_path
    expect(page).to have_content("Hello World")
    expect(page).to have_no_content("Upcoming")
    click_on "hide announcement"
    expect(page).to have_no_content("Hello World")
  end
end
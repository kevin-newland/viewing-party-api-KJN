require "rails_helper"

RSpec.describe ViewingParty, type: :model do
  describe "associations" do
    it { should belong_to(:host).class_name('User') }
    it { should have_many(:users_viewing_parties) }
    it { should have_many(:users).through(:users_viewing_parties) }
  end
end
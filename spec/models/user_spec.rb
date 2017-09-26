require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:email) }

    it { should validate_presence_of(:username) }

    it { should validate_presence_of(:first_name) }

    it { should validate_presence_of(:last_name) }

    it do
      should validate_length_of(:password).
        is_at_least(6).
        on(:create)
    end
  end
end

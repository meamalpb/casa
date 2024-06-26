require "rails_helper"

RSpec.describe ChecklistItemPolicy do
  subject { described_class }

  let(:casa_admin) { build_stubbed(:casa_admin) }
  let(:volunteer) { build_stubbed(:volunteer) }
  let(:supervisor) { build_stubbed(:supervisor) }

  permissions :new?, :create?, :edit?, :update?, :destroy? do
    it "allows casa_admins" do
      is_expected.to permit(casa_admin)
    end

    it "does not permit supervisor" do
      is_expected.to_not permit(supervisor)
    end

    it "does not permit volunteer" do
      is_expected.to_not permit(volunteer)
    end
  end
end

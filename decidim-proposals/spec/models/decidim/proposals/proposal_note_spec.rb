# frozen_string_literal: true

require "spec_helper"

module Decidim
  module Proposals
    describe ProposalNote do
      subject { proposal_note }

      let!(:organization) { create(:organization) }
      let!(:feature) { create(:feature, organization: organization, manifest_name: "proposals") }
      let!(:participatory_process) { create(:participatory_process, organization: organization) }
      let!(:author) { create(:user, :admin, organization: organization) }
      let!(:proposal) { create(:proposal, feature: feature, author: author) }
      let!(:proposal_note) { build(:proposal_note, proposal: proposal, author: author) }

      it "is valid" do
        expect(proposal_note).to be_valid
      end

      it "has an associated author" do
        expect(proposal_note.author).to be_a(Decidim::User)
      end

      it "has an associated proposal" do
        expect(proposal_note.proposal).to be_a(Decidim::Proposals::Proposal)
      end
    end
  end
end

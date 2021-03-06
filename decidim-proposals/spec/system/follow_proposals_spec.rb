# frozen_string_literal: true

require "spec_helper"

describe "Follow proposals", type: :system do
  let(:manifest_name) { "proposals" }

  let!(:followable) do
    create(:proposal, feature: feature)
  end

  include_examples "follows"
end

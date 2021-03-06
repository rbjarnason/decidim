# frozen_string_literal: true

require "spec_helper"

describe "Follow debates", type: :system do
  let(:manifest_name) { "debates" }

  let!(:followable) do
    create(:debate, feature: feature)
  end

  include_examples "follows"
end

# frozen_string_literal: true

require "spec_helper"

describe "Assembly admin manages assembly attachment collections", type: :system do
  include_context "when assembly admin administrating an assembly"

  let(:collection_for) { assembly }

  before do
    switch_to_host(organization.host)
    login_as user, scope: :user
    visit decidim_admin_assemblies.edit_assembly_path(assembly)
    click_link "Collections"
  end

  it_behaves_like "manage attachment collections examples"
end

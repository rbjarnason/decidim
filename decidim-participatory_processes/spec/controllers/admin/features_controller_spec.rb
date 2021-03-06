# frozen_string_literal: true

require "spec_helper"

module Decidim
  module ParticipatoryProcesses
    module Admin
      describe FeaturesController, type: :controller do
        routes { Decidim::ParticipatoryProcesses::AdminEngine.routes }

        let(:organization) { create(:organization) }
        let(:current_user) { create(:user, :confirmed, :admin, organization: organization) }
        let!(:participatory_process) do
          create(
            :participatory_process,
            :published,
            organization: organization
          )
        end
        let(:feature) do
          create(
            :feature,
            manifest_name: :dummy,
            participatory_space: participatory_process
          )
        end

        before do
          request.env["decidim.current_organization"] = organization
          request.env["decidim.current_participatory_process"] = participatory_process
          sign_in current_user
        end

        describe "PATCH update" do
          let(:feature_params) do
            {
              name_en: "Dummy feature",
              settings: {
                comments_enabled: true
              },
              default_step_settings: {
                comments_blocked: true
              }
            }
          end

          it "does not publish the default step settings change" do
            expect(Decidim::SettingsChange).not_to receive(:publish)

            patch :update, params: { participatory_process_slug: participatory_process.slug, id: feature.id, feature: feature_params }

            expect(response).to redirect_to features_path
          end
        end
      end
    end
  end
end

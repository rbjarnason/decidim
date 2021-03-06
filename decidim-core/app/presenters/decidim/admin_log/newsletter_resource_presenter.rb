# frozen_string_literal: true

module Decidim
  module AdminLog
    # This class extends the default resource presenter for logs, so that
    # it can properly link to the newsletter.
    class NewsletterResourcePresenter < Decidim::Log::ResourcePresenter
      private

      # Private: Finds the public link for the given static page..
      #
      # Returns an HTML-safe String.
      def resource_path
        @resource_path ||= h.decidim_admin.newsletter_path(resource)
      end
    end
  end
end

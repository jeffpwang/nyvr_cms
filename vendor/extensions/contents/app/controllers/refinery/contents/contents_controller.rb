module Refinery
  module Contents
    class ContentsController < ::ApplicationController

      before_action :find_all_contents
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @content in the line below:
        present(@page)
      end

      def show
        @content = Content.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @content in the line below:
        present(@page)
      end

      def data
        respond_to do |format|
          format.json
        end
      end

    protected

      def find_all_contents
        @contents = Content.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/contents").first
      end

    end
  end
end

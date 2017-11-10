module Refinery
  module Contents
    module Admin
      class ContentsController < ::Refinery::AdminController

        crudify :'refinery/contents/content'

        private

        # Only allow a trusted parameter "white list" through.
        def content_params
          params.require(:content).permit(:title, :thumbnail_id, :file_id)
        end
      end
    end
  end
end

module Refinery
  module Contents
    module Admin
      class ContentsController < ::Refinery::AdminController

        crudify :'refinery/contents/content'

        def data
          find_all_contents

          respond_to do |format|
            format.html
            format.json
          end
        end

        private

        def find_all_contents
          @contents = Content.order('position ASC')
        end
        # Only allow a trusted parameter "white list" through.
        def content_params
          params.require(:content).permit(:title, :thumbnail_id, :file_id)
        end
      end
    end
  end
end

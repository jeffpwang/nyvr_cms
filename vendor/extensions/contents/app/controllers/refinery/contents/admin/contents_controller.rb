module Refinery
  module Contents
    module Admin
      class ContentsController < ::Refinery::AdminController

        crudify :'refinery/contents/content'
        after_action :update_version, :only => [:update, :create, :destroy]


        private
        # Only allow a trusted parameter "white list" through.
        
        def update_version
          if (VersionControl.any?) 
            obj = VersionControl.all.first
          else
            obj = VersionControl.create(version: 3.0)
          end

          obj.version += 0.1
          obj.save
        end 
        
        def content_params
          params.require(:content).permit(:title, :thumbnail_id, :file_id)
        end
      end
    end
  end
end

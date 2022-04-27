class RecordAttachmentPolicy < ApplicationPolicy
    def new?
      user.admin?
    end
  
    def edit?
      user.admin?
    end
  
    def create?
      user.admin?
    end
    
    def update?
      user.admin?
    end
    
    def destroy?
      user.admin?
    end

    def delete_image_attachment?
      user.admin?
    end
  end
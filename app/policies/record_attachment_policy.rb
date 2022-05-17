class RecordAttachmentPolicy < ApplicationPolicy
    def new?
      user.superadmin?
    end
  
    def edit?
      user.superadmin?
    end
  
    def create?
      user.superadmin?
    end
    
    def update?
      user.superadmin?
    end
    
    def destroy?
      user.superadmin?
    end

    def delete_image_attachment?
      user.superadmin?
    end
  end
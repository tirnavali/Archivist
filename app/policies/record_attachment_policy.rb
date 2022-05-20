class RecordAttachmentPolicy < ApplicationPolicy
    def new?
      user.superadmin? || user.admin? || user.editor? || user.writer?
    end
  
    def edit?
      user.superadmin? || user.admin? || user.editor? || user.writer?
    end
  
    def create?
      user.superadmin? || user.admin? || user.editor? || user.writer?
    end
    
    def update?
      user.superadmin? || user.admin? || user.editor? || user.writer?
    end
    
    def destroy?
      user.superadmin? || user.admin? || user.editor?
    end

    def delete_image_attachment?
      user.superadmin? || user.admin? || user.editor?
    end
  end
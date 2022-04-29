class RecordAttachmentPolicy < ApplicationPolicy
    def new?
      user.has_role? :admin
    end
  
    def edit?
      user.has_role? :admin
    end
  
    def create?
      user.has_role? :admin
    end
    
    def update?
      user.has_role? :admin
    end
    
    def destroy?
      user.has_role? :admin
    end

    def delete_image_attachment?
      user.has_role? :admin
    end
  end
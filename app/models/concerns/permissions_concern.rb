module PermissionsConcern
	extend ActiveSupport::Concern

	def is_normal_user?
		self.permission_level >=1
	end
	def is_admin_user?
		self.permission_level >=2
	end
end

# frozen_string_literal: true
module CanCan
  # ControllerResourceBuilder
  module ControllerResourceBuilder
    protected

    def build_resource
      resource = resource_base.new(resource_params || {})
      assign_attributes(resource)
    end

    def assign_attributes(resource)
      resource.send("#{parent_name}=", parent_resource) if @options[:singleton] && parent_resource
      resource
    end
  end
end

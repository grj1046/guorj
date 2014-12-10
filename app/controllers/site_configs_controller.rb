class SiteConfigsController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user

  def index
    @site_configs = SiteConfig.all
  end

  def edit
    @site_config = SiteConfig.find(params[:id])
  end

  def update
    @site_config = SiteConfig.find(params[:id])

    if @site_config.update_attributes(params[:site_config].permit!)
      redirect_to edit_site_config_path(params[:id]), notice: '保存成功.'
    else
      render acton: 'edit'
    end
  end

  private
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

    def site_config_params
      params.require(:site_config).permit(:value)
    end
end

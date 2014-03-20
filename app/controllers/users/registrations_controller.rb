# encoding: utf-8
 class Users::RegistrationsController < Devise::RegistrationsController
  def create
    @data=DataContact.first
    @flag2=false
    @user=User.new(params[:user])
    if request.xhr?
      if !@user.save
        flash['create_error']= resource.errors.full_messages
        @flag2=true
        respond_to do |format|
           format.js
        end
      else
        @flag2=false
        flash['create_error']= resource.errors.full_messages
        sign_up(@user, resource)
        current_user=@user
        respond_to do |format|
          UserMailer.registr_message(@user,@data).deliver
          format.js { render :js => "window.location.href = '#{account_path}'" }
          @dog='question'
        end
      end
    else 
      if !@user.save
        flash['create_error']= resource.errors.full_messages
        @flag2=true
        respond_with resource
      else
        sign_up(@user, resource)
        current_user=@user
        respond_to do |format|
          UserMailer.delay.registr_message(@user,@data)
          format.html{ redirect_to account_path}
        end
      end 
    end
       
  end
  protected

  def update_needs_confirmation?(resource, previous)
    resource.respond_to?(:pending_reconfirmation?) &&
      resource.pending_reconfirmation? &&
      previous != resource.unconfirmed_email
  end

  # Build a devise resource passing in the session. Useful to move
  # temporary session data to the newly created user.
  def build_resource(hash=nil)
    hash ||= resource_params || {}
    self.resource = resource_class.new_with_session(hash, session)
  end

  # Signs in a user on sign up. You can overwrite this method in your own
  # RegistrationsController.
  def sign_up(resource_name, resource)
     sign_in(resource_name, resource)
  end

  # The path used after sign up. You need to overwrite this method
  # in your own RegistrationsController.
  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end
  def after_sign_in_path_for(resource)
    '/account'
  end

  # The path used after sign up for inactive accounts. You need to overwrite
  # this method in your own RegistrationsController.
  def after_inactive_sign_up_path_for(resource)
    account_path(@user)
    #respond_to?(:root_path) ? root_path : "/"
  end

  # The default url to be used after updating a resource. You need to overwrite
  # this method in your own RegistrationsController.
  def after_update_path_for(resource)
    account_path(@user)
    #signed_in_root_path(resource)
  end

  # Authenticates the current scope and gets the current resource from the session.
  def authenticate_scope!
    send(:"authenticate_#{resource_name}!", :force => true)
    self.resource = send(:"current_#{resource_name}")
  end
end

class SessionsController < Devise::SessionsController
    def new
      super
    end
  
    def create
        self.resource = warden.authenticate!(auth_options)
        set_flash_message(:notice, :signed_in) if is_navigational_format?
        sign_in(resource_name, resource)
        
        if !session[:return_to].blank?
          redirect_to session[:return_to]
          session[:return_to] = nil
        else
          respond_with resource, :location => after_sign_in_path_for(resource)
        end
      end

      def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          flash[:notice] = "Your account information was successfully updated"
          redirect_to users_path
        else
          render 'edit'
        end
    end
  end
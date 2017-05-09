class HomeController < ApplicationController
  def index
    @home = true
    @page = [{name: "Contact form", link: "/contacts"}]
    if session[:user]
      @page.push({name: "Profile", link: "/users/me"},
                 {name: "Edit Profile", link: "/users/me/edit"},
                 {name: "Logout", link: "/logout"})
    else 
      @page.push({name: "Register form", link: "users/register"},
                 {name: "Login form", link: "/login"})
    end
  end
end

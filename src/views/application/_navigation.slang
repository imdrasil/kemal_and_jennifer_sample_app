nav.navbar.navbar-defaul.navbar-fixed-top.navbar-inverse
  .container-fluid
    .navbar-header
      button.navbar-toggle.collapsed data-toggle="collapse" data-target="#navbar" aria-controls="navbar"
        span.sr-only Toggle navigation
        span.icon-bar
        span.icon-bar
        span.icon-bar
      == link_to root_path, "sample app", { "id" => "logo", "class" => "navbar-brand" }
    #navbar.navbar-collapse.collapse aria-expanded="false"
      ul.nav.navbar-nav.navbar-right
        li == link_to root_path, "Home"
        li == link_to about_path, "About"
        - if signed_in?
          li == link_to users_path, "Users"
          li.dropdown
            a.dropdown-toggle href="#" data-toggle="dropdown" role="button" aria-haspopup="true"
              | Account
              b.caret
            ul.dropdown-menu.inverse-dropdown
              li == link_to user_path(current_user!.id), "Profile"
              li == link_to user_edit_path(current_user!.id), "Settings"
              li.divider role="separator"
              li == link_to logout_path, "Log out", method: :delete
        - else
          li == link_to sign_in_path, "Sign in"

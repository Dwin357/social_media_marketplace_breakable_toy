module NavBarHelper
  # not working as expected
  # def li_for_navbar
  #   if current_user
  #     "<li>" + link_to("Logout", session_path(current_user!), method: :delete) + "</li>
  #     <li>" + link_to("charge it", new_charge_path) + "</li>"
  #   else
  #     "<li>" + link_to("Sign Up ", new_patron_path) + "</li>
  #     <li class='dropdown'>
  #       <a class='dropdown-toggle' data-toggle='dropdown'>
  #         Sign In <span class='caret'></span>
  #       </a>
  #       <ul class='dropdown-menu'>
  #         <li>"+link_to("Password", new_session_path)+"</li>
  #         <li>"+link_to("Twitter", "/auth/twitter")+"</li>
  #       </ul>
  #     </li>"
  #   end
  # end
end
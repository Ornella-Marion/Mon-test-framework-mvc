package mg.etu3273.test.model;

import mg.etu3273.framework.auth.UserSession;


public class MyUser implements UserSession {
    
    private String login;
    private String[] roles;
    private String email;
    private String fullName;
    

    public MyUser(String login, String[] roles) {
        this.login = login;
        this.roles = roles;
    }
    

    public MyUser(String login, String[] roles, String email, String fullName) {
        this.login = login;
        this.roles = roles;
        this.email = email;
        this.fullName = fullName;
    }
    
    @Override
    public String getLogin() {
        return login;
    }
    
    @Override
    public String[] getRoles() {
        return roles;
    }
    
    @Override
    public boolean hasRole(String role) {
        if (roles == null || role == null) {
            return false;
        }
        for (String r : roles) {
            if (r.equalsIgnoreCase(role)) {
                return true;
            }
        }
        return false;
    }
    
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getFullName() {
        return fullName;
    }
    
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
}

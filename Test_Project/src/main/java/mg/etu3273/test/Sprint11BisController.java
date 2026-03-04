package mg.etu3273.test;

import java.io.IOException;

import jakarta.servlet.http.HttpServletResponse;
import mg.etu3273.framework.ModelView;
import mg.etu3273.framework.annotation.Auth;
import mg.etu3273.framework.annotation.Controller;
import mg.etu3273.framework.annotation.GetUrl;
import mg.etu3273.framework.annotation.PostUrl;
import mg.etu3273.framework.annotation.Role;
import mg.etu3273.framework.auth.UserSession;
import mg.etu3273.framework.utils.SessionManager;
import mg.etu3273.test.model.MyUser;


@Controller
public class Sprint11BisController {
    

    @GetUrl("/s11bis/login")
    public ModelView showLoginPage() {
        return new ModelView("sprint11bis_login.jsp");
    }
    

    @GetUrl("/s11bis/home")
    public ModelView homePage() {
        ModelView mv = new ModelView("sprint11bis_home.jsp");
        mv.addObject("message", "Bienvenue sur notre site !");
        return mv;
    }

    @PostUrl("/s11bis/login")
    public ModelView doLogin(String username, String password, 
                            SessionManager session,
                            HttpServletResponse response) throws IOException {
        
        String[] roles = authenticate(username, password);
        
        if (roles != null) {
            MyUser user = new MyUser(username, roles, username + "@example.com", "Utilisateur " + username);
            session.set(UserSession.SESSION_KEY, user);  
            
            System.out.println("    Login réussi: " + username + " | Rôles: " + String.join(", ", roles));
            
            String redirectUrl = session.get("_redirect_after_login");
            if (redirectUrl != null) {
                session.remove("_redirect_after_login");
                response.sendRedirect(redirectUrl);
                return null;
            }
            
            response.sendRedirect("/test-framework-mvc/s11bis/dashboard");
            return null;
        }
        
        ModelView mv = new ModelView("sprint11bis_login.jsp");
        mv.addObject("error", "Identifiants incorrects");
        return mv;
    }
    
   
    private String[] authenticate(String username, String password) {
        if ("admin".equals(username) && "admin123".equals(password)) {
            return new String[]{"ADMIN", "USER"};
        }
        if ("prof".equals(username) && "prof123".equals(password)) {
            return new String[]{"PROF", "USER"};
        }
        if ("user".equals(username) && "user123".equals(password)) {
            return new String[]{"USER"};
        }
        return null;
    }
    
   
    @Auth(loginUrl = "/s11bis/login")
    @GetUrl("/s11bis/dashboard")
    public ModelView dashboard(SessionManager session) {
        MyUser user = session.get(UserSession.SESSION_KEY);
        
        ModelView mv = new ModelView("sprint11bis_dashboard.jsp");
        mv.addObject("user", user);
        mv.addObject("username", user != null ? user.getLogin() : "Inconnu");
        mv.addObject("roles", user != null ? String.join(", ", user.getRoles()) : "Aucun");
        return mv;
    }
    
    
    @Auth(loginUrl = "/s11bis/login")
    @GetUrl("/s11bis/profile")
    public ModelView profile(SessionManager session) {
        MyUser user = session.get(UserSession.SESSION_KEY);
        
        ModelView mv = new ModelView("sprint11bis_profile.jsp");
        mv.addObject("user", user);
        return mv;
    }
  
    @Role(value = "ADMIN", loginUrl = "/s11bis/login")
    @GetUrl("/s11bis/admin")
    public ModelView adminPage(SessionManager session) {
        MyUser user = session.get(UserSession.SESSION_KEY);
        
        ModelView mv = new ModelView("sprint11bis_admin.jsp");
        mv.addObject("user", user);
        mv.addObject("message", "Bienvenue dans l'espace administrateur !");
        return mv;
    }
    

    @Role(value = "PROF", loginUrl = "/s11bis/login")
    @GetUrl("/s11bis/prof")
    public ModelView profPage(SessionManager session) {
        MyUser user = session.get(UserSession.SESSION_KEY);
        
        ModelView mv = new ModelView("sprint11bis_prof.jsp");
        mv.addObject("user", user);
        mv.addObject("message", "Bienvenue dans l'espace professeur !");
        return mv;
    }
    
  
    @Role(value = {"ADMIN", "PROF"}, loginUrl = "/s11bis/login")
    @GetUrl("/s11bis/reports")
    public ModelView reportsPage(SessionManager session) {
        MyUser user = session.get(UserSession.SESSION_KEY);
        
        ModelView mv = new ModelView("sprint11bis_reports.jsp");
        mv.addObject("user", user);
        mv.addObject("message", "Page des rapports - accessible aux ADMIN et PROF");
        return mv;
    }
    
    @Auth(loginUrl = "/s11bis/login")
    @PostUrl("/s11bis/logout")
    public ModelView logout(SessionManager session, HttpServletResponse response) throws IOException {
        session.invalidate();
        response.sendRedirect("/test-framework-mvc/s11bis/home");
        return null;
    }
    
    @Auth(loginUrl = "/s11bis/login")
    @GetUrl("/s11bis/logout")
    public ModelView logoutGet(SessionManager session, HttpServletResponse response) throws IOException {
        session.invalidate();
        response.sendRedirect("/test-framework-mvc/s11bis/home");
        return null;
    }
}

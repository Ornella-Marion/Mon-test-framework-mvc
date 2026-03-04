package mg.etu3273.test;

import mg.etu3273.framework.ModelView;
import mg.etu3273.framework.annotation.Auth;
import mg.etu3273.framework.annotation.Controller;
import mg.etu3273.framework.annotation.GetUrl;
import mg.etu3273.framework.annotation.PostUrl;
import mg.etu3273.framework.annotation.SessionAttribute;
import mg.etu3273.framework.auth.UserSession;
import mg.etu3273.framework.utils.SessionManager;
import mg.etu3273.test.model.MyUser;


@Controller
public class AuthController {
    
    @PostUrl("/login")
    public ModelView login(String username, String password, SessionManager session) {
        if ("admin".equals(username) && "1234".equals(password)) {
            // Créer l'objet UserSession et le placer en session (Sprint 11-bis)
            MyUser user = new MyUser(username, new String[]{"ADMIN"}, username + "@example.com", "Admin User");
            session.set(UserSession.SESSION_KEY, user);
            
            // Garder aussi les attributs individuels pour compatibilité
            session.set("userId", 1);
            session.set("username", username);
            session.set("role", "ADMIN");
            session.setTimeout(3600);  // 1 heure
            
            session.flash("Bienvenue " + username + " !");
            
            ModelView mv = new ModelView("sprint11bis_dashboard.jsp");
            return mv;
        }
        
        ModelView mv = new ModelView("sprint11bis_login.jsp");
        mv.addObject("error", "Identifiants incorrects");
        return mv;
    }
    
    @Auth(loginUrl = "/s11bis/login")
    @GetUrl("/dashboard")
    public ModelView dashboard(@SessionAttribute("username") String username,
                               @SessionAttribute("role") String role,
                               SessionManager session) {
        String flash = session.getFlash();
        
        ModelView mv = new ModelView("sprint11bis_dashboard.jsp");
        mv.addObject("username", username);
        mv.addObject("role", role);
        mv.addObject("message", flash);
        return mv;
    }
    
    @PostUrl("/logout")
    public String logout(SessionManager session) {
        session.invalidate();
        return "Déconnexion réussie. <a href='/login'>Se reconnecter</a>";
    }
}
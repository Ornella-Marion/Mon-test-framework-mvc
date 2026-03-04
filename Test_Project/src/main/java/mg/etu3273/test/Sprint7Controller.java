package mg.etu3273.test;

import mg.etu3273.framework.ModelView;
import mg.etu3273.framework.annotation.Controller;
import mg.etu3273.framework.annotation.GetUrl;
import mg.etu3273.framework.annotation.PostUrl;
import mg.etu3273.framework.annotation.Url;


@Controller
public class Sprint7Controller {
    @GetUrl("/sprint7/form")
    public ModelView showForm() {
        ModelView mv = new ModelView("sprint7_form.jsp");
        mv.addObject("titre", "Sprint 7 : Formulaire");
        return mv;
    }

    @PostUrl("/sprint7/form")
    public ModelView submitForm(String nom, String email) {
        ModelView mv = new ModelView("sprint7_result.jsp");
        mv.addObject("titre", "Sprint 7 : POST");
        mv.addObject("nom", nom);
        mv.addObject("email", email);
        mv.addObject("method", "POST");
        return mv;
    }

    
    
    @GetUrl("/sprint7/hello")
    public String helloGet() {
        return "🟢 Sprint 7 : Réponse GET";
    }

    @PostUrl("/sprint7/hello")
    public String helloPost() {
        return "🔵 Sprint 7 : Réponse POST";
    }

    
    
    @Url("/sprint7/legacy")
    public String legacy() {
        return "⚪ Sprint 7 : @Url accepte GET et POST";
    }

   
    
    @GetUrl("/sprint7/user/{id}")
    public ModelView getUserGet(Integer id) {
        ModelView mv = new ModelView("sprint7_result.jsp");
        mv.addObject("titre", "Sprint 7 : GET dynamique");
        mv.addObject("nom", "Utilisateur #" + id);
        mv.addObject("email", "user" + id + "@example.com");
        mv.addObject("method", "GET");
        return mv;
    }

    @PostUrl("/sprint7/user/{id}")
    public ModelView getUserPost(Integer id, String action) {
        ModelView mv = new ModelView("sprint7_result.jsp");
        mv.addObject("titre", "Sprint 7 : POST dynamique");
        mv.addObject("nom", "Utilisateur #" + id);
        mv.addObject("email", "Action : " + action);
        mv.addObject("method", "POST");
        return mv;
    }
}
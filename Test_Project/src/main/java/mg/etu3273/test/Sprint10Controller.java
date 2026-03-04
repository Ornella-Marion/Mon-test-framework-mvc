package mg.etu3273.test;

import java.io.IOException;

import mg.etu3273.framework.ModelView;
import mg.etu3273.framework.annotation.Controller;
import mg.etu3273.framework.annotation.GetUrl;
import mg.etu3273.framework.annotation.PostUrl;
import mg.etu3273.framework.utils.FileUpload;

@Controller
public class Sprint10Controller {

    private static final String UPLOAD_DIRECTORY = "C:/uploads/";

      @GetUrl("/test/sprint10_index") 
    public ModelView show_index () {
        ModelView mv = new ModelView("sprint10_index.html");
        mv.addObject("titre", "Index de sprint 10");
        return mv;
    }
    
    @GetUrl("/sprint10/form-single")
    public ModelView showFormSingle() {
        ModelView mv = new ModelView("sprint10_form_single.jsp");
        mv.addObject("titre", "Sprint 10 : Upload d'un fichier");
        return mv;
    }

    @PostUrl("/sprint10/upload-single")
    public ModelView uploadSingle(FileUpload photo, String description) {
        System.out.println(" SPRINT 10 - Upload single:");
        System.out.println("   - Fichier: " + (photo != null ? photo.getName() : "null"));
        System.out.println("   - Description: " + description);
        
        ModelView mv = new ModelView("sprint10_result.jsp");
        mv.addObject("titre", "Sprint 10 : Résultat upload");
        
        if (photo != null && !photo.isEmpty()) {
            try {
                String savedPath = photo.saveTo(UPLOAD_DIRECTORY);
                
                mv.addObject("success", true);
                mv.addObject("fileName", photo.getName());
                mv.addObject("fileSize", photo.getFormattedSize());
                mv.addObject("fileType", photo.getContentType());
                mv.addObject("savedPath", savedPath);
                mv.addObject("description", description);
                
            } catch (IOException e) {
                e.printStackTrace();
                mv.addObject("success", false);
                mv.addObject("error", "Erreur sauvegarde: " + e.getMessage());
            }
        } else {
            mv.addObject("success", false);
            mv.addObject("error", "Aucun fichier uploadé");
        }
        
        return mv;
    }


    @GetUrl("/sprint10/form-multiple")
    public ModelView showFormMultiple() {
        ModelView mv = new ModelView("sprint10_form_multiple.jsp");
        mv.addObject("titre", "Sprint 10 : Upload multiple");
        return mv;
    }

    @PostUrl("/sprint10/upload-multiple")
    public ModelView uploadMultiple(FileUpload document, FileUpload image, String titre) {
        System.out.println(" SPRINT 10 - Upload multiple:");
        System.out.println("   - Document: " + (document != null ? document.getName() : "null"));
        System.out.println("   - Image: " + (image != null ? image.getName() : "null"));
        System.out.println("   - Titre: " + titre);
        
        ModelView mv = new ModelView("sprint10_result_multiple.jsp");
        mv.addObject("titre", "Sprint 10 : Upload multiple");
        mv.addObject("titre_doc", titre);
        
        int uploadedCount = 0;
        StringBuilder savedFiles = new StringBuilder();
        
        if (document != null && !document.isEmpty()) {
            try {
                String path = document.saveTo(UPLOAD_DIRECTORY);
                mv.addObject("documentName", document.getName());
                mv.addObject("documentSize", document.getFormattedSize());
                mv.addObject("documentPath", path);
                uploadedCount++;
                savedFiles.append(document.getName()).append(", ");
            } catch (IOException e) {
                mv.addObject("documentError", e.getMessage());
            }
        }
        
        if (image != null && !image.isEmpty()) {
            try {
                String path = image.saveTo(UPLOAD_DIRECTORY);
                mv.addObject("imageName", image.getName());
                mv.addObject("imageSize", image.getFormattedSize());
                mv.addObject("imagePath", path);
                uploadedCount++;
                savedFiles.append(image.getName());
            } catch (IOException e) {
                mv.addObject("imageError", e.getMessage());
            }
        }
        
        mv.addObject("uploadedCount", uploadedCount);
        mv.addObject("savedFiles", savedFiles.toString());
        
        return mv;
    }

    
    @GetUrl("/sprint10/form-with-object")
    public ModelView showFormWithObject() {
        ModelView mv = new ModelView("sprint10_form_with_object.jsp");
        mv.addObject("titre", "Sprint 10 : Upload + Objet");
        return mv;
    }

    @PostUrl("/sprint10/upload-with-object")
    public ModelView uploadWithObject(mg.etu3273.test.model.Employee e, FileUpload cv) {
        System.out.println(" SPRINT 10 - Upload avec objet:");
        System.out.println("   - Employee: " + (e != null ? e.getNom() : "null"));
        System.out.println("   - CV: " + (cv != null ? cv.getName() : "null"));
        
        ModelView mv = new ModelView("sprint10_result_with_object.jsp");
        mv.addObject("titre", "Sprint 10 : Upload + Objet");
        mv.addObject("employee", e);
        
        if (cv != null && !cv.isEmpty()) {
            try {
                String newFileName = "cv_" + e.getNom().replace(" ", "_") + cv.getExtension();
                String path = cv.saveTo(UPLOAD_DIRECTORY, newFileName);
                
                mv.addObject("cvName", cv.getName());
                mv.addObject("cvSize", cv.getFormattedSize());
                mv.addObject("savedPath", path);
                mv.addObject("success", true);
                
            } catch (IOException ex) {
                mv.addObject("error", ex.getMessage());
                mv.addObject("success", false);
            }
        } else {
            mv.addObject("success", false);
            mv.addObject("error", "Aucun CV uploadé");
        }
        
        return mv;
    }

    
    @GetUrl("/sprint10/form-with-map")
    public ModelView showFormWithMap() {
        ModelView mv = new ModelView("sprint10_form_with_map.jsp");
        mv.addObject("titre", "Sprint 10 : Upload + Map");
        return mv;
    }

    @PostUrl("/sprint10/upload-with-map")
    public ModelView uploadWithMap(java.util.Map<String, Object> params, FileUpload fichier) {
        System.out.println(" SPRINT 10 - Upload avec Map:");
        System.out.println("   - Params: " + params.keySet());
        System.out.println("   - Fichier: " + (fichier != null ? fichier.getName() : "null"));
        
        ModelView mv = new ModelView("sprint10_result_with_map.jsp");
        mv.addObject("titre", "Sprint 10 : Upload + Map");
        mv.addObject("params", params);
        
        if (fichier != null && !fichier.isEmpty()) {
            try {
                String path = fichier.saveTo(UPLOAD_DIRECTORY);
                mv.addObject("fileName", fichier.getName());
                mv.addObject("fileSize", fichier.getFormattedSize());
                mv.addObject("savedPath", path);
                mv.addObject("success", true);
            } catch (IOException e) {
                mv.addObject("error", e.getMessage());
                mv.addObject("success", false);
            }
        }
        
        return mv;
    }

     @GetUrl("/sprint10/form-ultimate")
    public ModelView showFormUltimate() {
        ModelView mv = new ModelView("sprint10_form_ultimate.jsp");
        return mv;
    }

    @PostUrl("/sprint10/upload-ultimate")
    public ModelView uploadUltimate(mg.etu3273.test.model.Employee e, 
                                   java.util.Map<String, Object> meta, 
                                   FileUpload cv) {
        System.out.println(" SPRINT 10 - TEST ULTIME:");
        System.out.println("   - Employee: " + (e != null ? e.getNom() : "null"));
        System.out.println("   - Meta: " + (meta != null ? meta.keySet() : "null"));
        System.out.println("   - CV: " + (cv != null ? cv.getName() : "null"));
        
        ModelView mv = new ModelView("sprint10_result_ultimate.jsp");
        mv.addObject("titre", "Sprint 10 : TEST ULTIME");
        mv.addObject("employee", e);
        mv.addObject("meta", meta);
        
        if (cv != null && !cv.isEmpty()) {
            try {
                String fileName = "cv_" + e.getNom().replace(" ", "_") + cv.getExtension();
                String path = cv.saveTo(UPLOAD_DIRECTORY, fileName);
                
                mv.addObject("cvName", cv.getName());
                mv.addObject("cvSize", cv.getFormattedSize());
                mv.addObject("savedPath", path);
                mv.addObject("success", true);
                
            } catch (IOException ex) {
                mv.addObject("error", ex.getMessage());
                mv.addObject("success", false);
            }
        } else {
            mv.addObject("success", false);
            mv.addObject("error", "Aucun CV uploadé");
        }
        
        return mv;
    }
}

package mg.etu3273.test;

import java.util.ArrayList;
import java.util.List;

import mg.etu3273.framework.ModelView;
import mg.etu3273.framework.annotation.Controller;
import mg.etu3273.framework.annotation.GetUrl;
import mg.etu3273.framework.annotation.RestAPI;
import mg.etu3273.test.model.Department;
import mg.etu3273.test.model.Employee;

@Controller
public class Sprint9Controller {
    @GetUrl("/test/sprint9_index") 
    public ModelView show_index () {
        ModelView mv = new ModelView("sprint9_index.html");
        mv.addObject("titre", "Index de sprint 9");
        return mv;
    }

    
    @RestAPI
    @GetUrl("/api/employee/{id}")
    public Employee getEmployee(Integer id) {
        System.out.println(" API: getEmployee(" + id + ")");
        
        Employee e = new Employee();
        e.setNom("Jean Rakoto");
        e.setAge(30);
        e.setSalaire(2500000.0);
        
        return e; 
    }

    
    @RestAPI
    @GetUrl("/api/employees")
    public List<Employee> getEmployees() {
        System.out.println(" API: getEmployees()");
        
        List<Employee> employees = new ArrayList<>();
        
        Employee e1 = new Employee();
        e1.setNom("Jean Rakoto");
        e1.setAge(30);
        e1.setSalaire(2500000.0);
        
        Employee e2 = new Employee();
        e2.setNom("Marie Rasoa");
        e2.setAge(28);
        e2.setSalaire(3000000.0);
        
        Employee e3 = new Employee();
        e3.setNom("Paul Randria");
        e3.setAge(35);
        e3.setSalaire(4000000.0);
        
        employees.add(e1);
        employees.add(e2);
        employees.add(e3);
        
        return employees;  
    }

    @RestAPI
    @GetUrl("/api/message")
    public String getMessage() {
        System.out.println(" API: getMessage()");
        return "Hello from REST API!";
    }


    @RestAPI
    @GetUrl("/api/count")
    public Integer getCount() {
        System.out.println(" API: getCount()");
        return 42;
    }


    @RestAPI
    @GetUrl("/api/data")
    public ModelView getData() {
        System.out.println(" API: getData() avec ModelView");
        
        ModelView mv = new ModelView();
        mv.addObject("name", "Jean Rakoto");
        mv.addObject("age", 30);
        mv.addObject("city", "Antananarivo");
        
        return mv;
    }


    @RestAPI
    @GetUrl("/api/employee-full/{id}")
    public Employee getEmployeeFull(Integer id) {
        System.out.println(" API: getEmployeeFull(" + id + ")");
        
        Employee e = new Employee();
        e.setNom("Sophie Andrianina");
        e.setAge(32);
        e.setSalaire(3500000.0);
        
        Department d = new Department();
        d.setNom("Direction Technique");
        d.setCode("TECH01");
        d.setBudget(150000000);
        
        e.setDepartment(d);
        
        List<String> hobbies = new ArrayList<>();
        hobbies.add("Programmation");
        hobbies.add("Lecture");
        hobbies.add("Voyage");
        e.setHobbies(hobbies);
        
        return e;
    }

    @RestAPI
    @GetUrl("/api/departments")
    public List<Department> getDepartments() {
        System.out.println(" API: getDepartments()");
        
        List<Department> departments = new ArrayList<>();
        
        Department d1 = new Department();
        d1.setNom("Ressources Humaines");
        d1.setCode("RH01");
        d1.setBudget(50000000);
        
        Department d2 = new Department();
        d2.setNom("Direction Technique");
        d2.setCode("TECH01");
        d2.setBudget(150000000);
        
        Department d3 = new Department();
        d3.setNom("Marketing");
        d3.setCode("MKT01");
        d3.setBudget(80000000);
        
        departments.add(d1);
        departments.add(d2);
        departments.add(d3);
        
        return departments;
    }

    @GetUrl("/web/employees")
    public ModelView getEmployeesWeb() {
        System.out.println(" WEB: getEmployeesWeb() - Mode classique (JSP)");
        
        List<Employee> employees = new ArrayList<>();
        
        Employee e1 = new Employee();
        e1.setNom("Jean Rakoto");
        e1.setAge(30);
        
        Employee e2 = new Employee();
        e2.setNom("Marie Rasoa");
        e2.setAge(28);
        
        employees.add(e1);
        employees.add(e2);
        
        ModelView mv = new ModelView("sprint9_employees.jsp");
        mv.addObject("employees", employees);
        mv.addObject("titre", "Liste des employés (mode Web)");
        
        return mv;  
    }
}
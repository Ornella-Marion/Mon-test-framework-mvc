package mg.etu3273.test.model;

import java.util.List;


public class Employee {
    private String nom;
    private Integer age;
    private Double salaire;
    private Department department; 
    private List<String> hobbies;  
    
    public Employee() {
    }
    
    public Employee(String nom, Integer age, Double salaire) {
        this.nom = nom;
        this.age = age;
        this.salaire = salaire;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Double getSalaire() {
        return salaire;
    }

    public void setSalaire(Double salaire) {
        this.salaire = salaire;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public List<String> getHobbies() {
        return hobbies;
    }

    public void setHobbies(List<String> hobbies) {
        this.hobbies = hobbies;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "nom='" + nom + '\'' +
                ", age=" + age +
                ", salaire=" + salaire +
                ", department=" + department +
                ", hobbies=" + hobbies +
                '}';
    }

    public void setModifiedBy(Integer currentUserId) {
        throw new UnsupportedOperationException("Unimplemented method 'setModifiedBy'");
    }
}
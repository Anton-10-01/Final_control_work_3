package NurseryAccountingSystem;

import java.util.ArrayList;
import java.util.HashMap;

public class AnimalRegistration {
    private ArrayList<Animal> animalReg;

    public AnimalRegistration() {
        this.animalReg = new ArrayList<>();
    }

    public void addNewAnimal(int id, String name, String view, String dateOfBirth){
        HashMap<String, Animal> newAnimal = new HashMap<>();
        newAnimal.put("Кошка", new Cat(id, name, view, dateOfBirth));
        newAnimal.put("Собака",new Dog(id, name, view, dateOfBirth));
        newAnimal.put("Хомяк",new Hamstel(id, name, view, dateOfBirth));
        newAnimal.put("Лошадь",new Hourse(id, name, view, dateOfBirth));
        newAnimal.put("Верблюд",new Camel(id, name, view, dateOfBirth));
        newAnimal.put("Осел",new Donkey(id, name, view, dateOfBirth));

        Animal animal = newAnimal.get(view);
        animalReg.add(animal);
    }

    public void printAnimal(){
        for(Animal elem: animalReg){
            System.out.println(elem);
            System.out.println("---------");
        }
    }

    public void comandAnimal(String name) {
        int count = 0;
        for (Animal elem: animalReg){
            if(name.equals(elem.getName())) {
                System.out.println(elem.getCommand());
                count++;
            }
        }
        if(count == 0) {
            System.out.println("Нет такого животного");
        }
    }

    public void addComandAnimal(String name, String comand){
        int count = 0;
        for (Animal elem: this.animalReg){
            if(elem.getName().equals(name)) {
                elem.addComand(comand);
                count++;
            }
        }
        if(count == 0) {
            System.out.println("Нет такого животного");
        }
    }
}

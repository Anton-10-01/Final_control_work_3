package NurseryAccountingSystem;

import java.util.ArrayList;
import java.util.List;

public class Animal {
    private int id;
    private String view;
    private String name;
    private List<String>  command;
    private String dateOfBirth;

    public Animal(int id, String name, String view, String dateOfBirth) {
        this.id = id;
        this.name = name;
        this.view = view;
        this.command = new ArrayList<>();
        this.dateOfBirth = dateOfBirth;
    }

    @Override
    public String toString() {
        return "id: " + id + "\n" +
                "Имя: " + name + "\n" +
                "Тип: " + view + "\n" +
                "Команда: " + command + "\n" +
                "Дата рождения: " + dateOfBirth;
    }

    public String getName() {
        return name;
    }

    public List<String> getCommand() {
        return command;
    }

    public void addComand(String comandAnimal){
        command.add(comandAnimal);
    }
}

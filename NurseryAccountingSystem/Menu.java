package NurseryAccountingSystem;


import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Menu {
    public Menu() {
    }

    public void menuAnimal() {
        AnimalRegistration animalRegistration = new AnimalRegistration();
        Counter counter = new Counter();
        List<String> animalList = new ArrayList<>();
        Scanner iScanner = new Scanner(System.in);
        boolean run = true;
        while(run) {
            System.out.println("1. Завести новое животное!");
            System.out.println("2. Увидеть список команд, которое выполняет животное!");
            System.out.println("3. Обучить животное новым командам!");
            System.out.println("4. Показать всех животных!");
            System.out.println("5. Выход");
            String userChoice = iScanner.nextLine();
            switch (userChoice) {
                case "1":
                    System.out.print("Введи имя: ");
                    String name = iScanner.nextLine();
                    System.out.print("Введи тип животного(Собака, Кошка, Хомяк, Лошадь, Верблюд, Осел): ");
                    String view = iScanner.nextLine();
                    System.out.print("Введи дату рождения: ");
                    String dateOfBirth = iScanner.nextLine();
                    if(view.equals("Кошка") || view.equals("Собака") || view.equals("Хомяк") || view.equals("Лошадь") || view.equals("Верблюд") || view.equals("Осел")) {
                        animalList.add(view);
                        animalRegistration.addNewAnimal(counter.getCounter(), name, view, dateOfBirth);
                        counter.addCounter();
                    } else {
                        System.out.println("Вы ввели не корректные данные!");
                    }
                    break;
                case "2":
                    System.out.print("Введи имя: ");
                    String nameAnimal = iScanner.nextLine();
                    animalRegistration.comandAnimal(nameAnimal);
                    break;
                case "3":
                    System.out.print("Введи имя: ");
                    String name1 = iScanner.nextLine();
                    System.out.print("Введи команду: ");
                    String comand1 = iScanner.nextLine();
                    animalRegistration.addComandAnimal(name1, comand1);
                    break;
                case "4":
                    animalRegistration.printAnimal();
                    break;
                case "5":
                    run = false;
                    break;
                default:
                    System.out.println("Error!");
                    break;
            }
        }
        iScanner.close();
    }
}

package ru.itis.drugstore.parsers;

public class Main {
    public static void main(String[] args) {
        Parser parser = new MainParser();
        for(Item item : parser.getItemsListByRequest("анальгин")){
            System.out.println(item);
        }
    }
}

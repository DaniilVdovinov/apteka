package ru.itis.drugstore.models;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Item implements Comparable<Item>{

    private String name;
    private Double price;
    private String href;
    private String img;

    @Override
    public int compareTo(Item u) {
        if(this.price > u.getPrice()){
            return 1;
        }
        else {
            return -1;
        }
    }

}
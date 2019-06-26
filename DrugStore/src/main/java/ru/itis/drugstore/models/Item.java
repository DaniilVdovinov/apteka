package ru.itis.drugstore.models;

import lombok.*;

@ToString
@EqualsAndHashCode
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Item implements Comparable<Item>{

    private String name;
    private Double price;
    private String href;
    private String img;

    public String getName(){
        return name;
    }

    public String getHref() {
        return href;
    }

    public String getImg(){
        return img;
    }

    public Double getPrice() {
        return price;
    }

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
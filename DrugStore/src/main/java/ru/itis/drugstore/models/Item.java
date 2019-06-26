package ru.itis.drugstore.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
//@Entity
public class Item implements Comparable<Item>{

    private String name;
    private Double price;
    private String href;
    private String img;


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

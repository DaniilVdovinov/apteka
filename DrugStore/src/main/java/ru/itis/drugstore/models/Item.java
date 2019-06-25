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
    private String price;
    private String href;
    private String img;

    @Override
    public int compareTo(Item u) {
        if(Double.parseDouble(getPrice())<Double.parseDouble(u.getPrice()))
            return -1;
        else if(Double.parseDouble(u.getPrice())<Double.parseDouble(getPrice()))
            return 1;
        return 0;
    }

  }

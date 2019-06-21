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
//    @Id
//    @GeneratedValue(strategy= GenerationType.AUTO)
//    private Integer id;

    private String name;
    private String price;
    private String href;
    private String img;

    @Override
    public int compareTo(Item u) {
        if (getPrice() == null || u.getPrice() == null) {
            return 0;
        }
        return getPrice().compareTo(u.getPrice());
    }


//    @ManyToMany
//    @JoinTable(
//            name="item_pharmacy",
//            joinColumns=@JoinColumn(name="item_id", referencedColumnName="id"),
//            inverseJoinColumns=@JoinColumn(name="pharmacy_id", referencedColumnName="id"))
//    private List<Pharmacy> pharmacies;
  }

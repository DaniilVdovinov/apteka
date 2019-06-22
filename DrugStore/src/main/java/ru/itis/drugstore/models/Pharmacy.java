//package ru.itis.drugstore.models;
//
//import lombok.AllArgsConstructor;
//import lombok.Builder;
//import lombok.Data;
//import lombok.NoArgsConstructor;
//
//import javax.persistence.*;
//import java.util.List;
//
//@Data
//@AllArgsConstructor
//@NoArgsConstructor
//@Builder
//@Entity
//public class Pharmacy {
//    @Id
//    @GeneratedValue(strategy= GenerationType.AUTO)
//    private Integer id;
//
//    private String name;
//    private String address;
//
//    @ManyToMany(mappedBy = "pharmacies")
//    private List<Item> items;
//
//}

package ru.itis.drugstore.models;
import lombok.*;

import javax.persistence.*;

@ToString
@EqualsAndHashCode
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "item_like")
public class LikeItem implements Comparable<LikeItem>{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "item_id")
    private Long id;

    private String name;
    private String price;
    private String href;
    private String img;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

    public Long getId() {
        return id;
    }

    public String getName(){
        return name;
    }

    public String getHref() {
        return href;
    }

    public String getImg(){
        return img;
    }

    public String getPrice() {
        return price != null ? price : "0";
    }

    @Override
    public int compareTo(LikeItem u) {
        if(Double.parseDouble(getPrice())<Double.parseDouble(u.getPrice()))
            return -1;
        else if(Double.parseDouble(u.getPrice())<Double.parseDouble(getPrice()))
            return 1;
        return 0;
    }

}

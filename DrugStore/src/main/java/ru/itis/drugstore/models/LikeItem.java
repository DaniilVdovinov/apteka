package ru.itis.drugstore.models;
import lombok.*;

import javax.persistence.*;

@Data
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
    private Double price;
    private String href;
    private String img;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

    @Override
    public int compareTo(LikeItem u) {
        if(this.price > u.getPrice()){
            return 1;
        }
        else {
            return -1;
        }
    }

}

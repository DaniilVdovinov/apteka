package ru.itis.drugstore.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "usr")
public class User{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String username;
    private String email;
    private String password;

    @Enumerated(value = EnumType.STRING)
    private UserState state;

    private String confirmString;

    public boolean isEnabled() {
        return this.getState().equals(UserState.CONFIRMED);
    }
}

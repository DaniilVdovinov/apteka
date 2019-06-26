package ru.itis.drugstore.models;

import lombok.*;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Auth {
    private Long id;
    private String cookieValue;
    private User user;
}

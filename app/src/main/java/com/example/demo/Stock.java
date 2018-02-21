package com.example.demo;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class Stock {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Integer price;
    private String symbol;
}
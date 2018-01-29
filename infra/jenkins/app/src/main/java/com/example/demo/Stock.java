package com.example.demo;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
public class Stock {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private int value;
    private String name;
}
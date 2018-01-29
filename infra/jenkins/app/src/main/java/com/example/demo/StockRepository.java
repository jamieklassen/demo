package com.example.demo;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "stocks", path = "stocks")
public interface StockRepository extends CrudRepository<Stock, Long> {
}
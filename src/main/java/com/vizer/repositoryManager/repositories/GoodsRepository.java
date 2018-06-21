package com.vizer.repositoryManager.repositories;

import org.springframework.data.repository.CrudRepository;

import com.vizer.repositoryManager.entities.Goods;


// This will be AUTO IMPLEMENTED by Spring into a Bean called goodsRepository
// CRUD refers Create, Read, Update, Delete

public interface GoodsRepository extends CrudRepository<Goods, Long> {
	// can also use JPQL
}
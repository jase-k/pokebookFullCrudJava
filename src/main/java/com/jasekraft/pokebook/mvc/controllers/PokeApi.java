package com.jasekraft.pokebook.mvc.controllers;

import org.springframework.web.bind.annotation.RestController;

import com.jasekraft.pokebook.mvc.services.ExpenseService;

@RestController
public class PokeApi {

	private final ExpenseService expenseService;
	
	public PokeApi(ExpenseService expenseService) {
		this.expenseService = expenseService;
	}
	

}

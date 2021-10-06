package com.jasekraft.pokebook.mvc.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jasekraft.pokebook.mvc.models.Expense;
import com.jasekraft.pokebook.mvc.services.ExpenseService;

@Controller
public class PokeController {

	private final ExpenseService expenseService;
	
	public PokeController(ExpenseService expenseService) {
		this.expenseService = expenseService;
	}
	
	@RequestMapping("/")
	public String index(@ModelAttribute("expense") Expense expense, Model model) {
		List<Expense> expenses = expenseService.allExpenses();
		model.addAttribute("expenses", expenses);
		return "index.jsp";
	}

	@RequestMapping(value="/new_expense", method=RequestMethod.POST)
	public String newExpense(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
		if(result.hasErrors()) {
			return "index.jsp";
		}
		else {
			expenseService.createExpense(expense);
			return "redirect:/";			
		}
	}
	
	@RequestMapping("/expense/{id}/edit")
	public String editExpense(@PathVariable("id") long id,
			Model model) {
		Expense expense = expenseService.findExpense(id);
		model.addAttribute("expense", expense);
		return "/expense/edit.jsp";
	}
	
	@RequestMapping("/update_expense")
	public String updateExpense(@RequestParam("id") long id, 
			@RequestParam("name") String name, 
			@RequestParam("vendor") String vendor,
			@RequestParam("amount") double amount,
			@RequestParam("description") String description,
			@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
		if(result.hasErrors()) {
			return "/expense/edit.jsp";
		}
		else {
			expenseService.updateExpense(id, name, vendor, amount, description);
			return "redirect:/";
		}
	}
	
}

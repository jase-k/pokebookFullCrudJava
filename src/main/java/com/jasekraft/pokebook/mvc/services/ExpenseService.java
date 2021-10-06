package com.jasekraft.pokebook.mvc.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.jasekraft.pokebook.mvc.models.Expense;
import com.jasekraft.pokebook.mvc.repositories.ExpenseRepo;

@Service
public class ExpenseService {
	private final ExpenseRepo expRepo;
	
	public ExpenseService(ExpenseRepo expRepo) {
		this.expRepo = expRepo;
	}
	
	 // returns all the expenses
    public List<Expense> allExpenses() {
        return expRepo.findAll();
    }
    // creates an expense
    public Expense createExpense(Expense e) {
        return expRepo.save(e);
    }
    // retrieves an Expense by Id
    public Expense findExpense(Long id) {
        Optional<Expense> optionalExpense = expRepo.findById(id);
        if(optionalExpense.isPresent()) {
            return optionalExpense.get();
        } else {
            return null;
        }
    }
    public void deleteExpense(long id) {
    	expRepo.deleteById(id);
    }
    
    public Expense updateExpense(long id, String name, String vendor,  double amount) {
    	Optional<Expense> optionalExpense = expRepo.findById(id);
    	if(optionalExpense.isPresent()) {
    		Expense expense = optionalExpense.get();
    		expense.setName(name);
    		expense.setVendor(vendor);
    		expense.setAmount(amount);
    		expRepo.save(expense);
    		return expense;
    	}
    	else {
    		return null;
    	}
    }
}

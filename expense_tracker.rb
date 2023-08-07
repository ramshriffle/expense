require_relative 'expense'
require_relative 'check_input'

module ExpenseTracker
  
  def initialize
     @addexpense=[]
  end


  def input_values
      print "Enter the amount: "
      @amount=valid_amount

      print "Enter the category: "
      @category = valid_category
     
    
      print "Enter the date (YYYY-MM-DD): "
      @date = valid_date  
  end


  def add_expense
    input_values()
    expenses=Expense.new(@amount,@category,@date)
    @addexpense << expenses

    puts "\nExpense added successfully!\n\n"
  end


  def view_expense(expense_list=@addexpense)
    if expense_list.empty?
      puts "No expense record available\n\n"
    else
      puts "%-15s %-15s %-15s" % ["Amount", "Category", "Date"]
      puts "---------------------------------------------------"

      expense_list.each do|expense|
      puts "%-15s %-15s %-15s" % [expense.amount, expense.category, expense.date]
      end
      total_expense
        puts "---------------------------------------------------"
      end
  end


  def total_expense
    total_expense=0
    index=0
    while index < @addexpense.length
      total_expense+=@addexpense[index].amount.to_f
      index +=1
    end
      puts "\nTotal Expense is : #{total_expense}"
  end


  def filter_expense
    if @addexpense.empty?
      puts "No expense record available"
    else
      loop do
        print "Enter the category to filter expense: "
        category = valid_category

        if category.empty?
          print "Please insert categoty, blank value not accepte try again"
        else
          result=@addexpense.select{|expense|expense.category==category}
          puts "\nFiltered Expenses: "
          return view_expense(result)
        end
      end
    end
  end


  def edit_expense
    if @addexpense.empty?
      puts "No expense record available"
    else
      print "Enter the index to edit expense list: "
      index=valid_index
      index-=1
      input_values()
  
      @addexpense[index].amount=@amount
      @addexpense[index].category=@category
      @addexpense[index].date=@date

      puts "\nEdit Expense Successfully"
      return "Edit expense is: Amount : #{@addexpense[index].amount}     "+
      "Category : #{@addexpense[index].category}     Date : #{@addexpense[index].date}\n\n"
    end
  end


  def delete_expense
    if @addexpense.empty?
      puts "No expense record available"
    else
      print "Enter the index to delete expense list: "
      index=valid_index
      deleted_item= @addexpense.delete_at(index-1)
      
      puts "\nExpense deleted successfully!"
      return "deleted expense is: Amount : #{deleted_item.amount}   "+
      "Category : #{deleted_item.category}     Date : #{deleted_item.date}\n\n"
    end
  end


  def valid_index
    count=0
    index=gets.chomp.to_i
    while index <=0 || index > @addexpense.length 
      count+=1
      if count==3
        puts "\nMultiple times invalid input"
        start_main
      end
      print "Invalid index try again Enter index: "
      index=gets.chomp.to_i
    end
    return index
  end
end




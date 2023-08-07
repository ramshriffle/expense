require_relative "expense_tracker"
require_relative "check_input" 

class Main
  include CheckInput
  include ExpenseTracker

  def start_main
    puts "Exprense-Tracker"

    loop do
      count=0
      puts "1 : Add Expense"
      puts "2 : View Expenses"
      puts "3 : Filter Expenses"
      puts "4 : Edit Expense"
      puts "5 : Delete Expense"
      puts "6 : Exit"
      puts "________________________________________________________"     
      print "\nPlease enter your choice : "

      choice=gets.chomp
      while choice.empty? || !/^[A-Za-z\s]+$/.match(choice)
          count+=1
          if count==3
            puts "\nMultiple times invalid input"
            exit
          end
          print "invalid choice try again: "
          choice=gets.chomp
      end
      
     case choice.to_i
      when 1
        add_expense
      when 2
        view_expense       
      when 3
        filter_expense
      when 4
        puts edit_expense
      when 5
        puts delete_expense
      when 6
        puts "Thank you"
        puts "Exit"
        exit
      end
    end
  end 
end
start_expense_tracking=Main.new
start_expense_tracking.start_main

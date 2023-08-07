module CheckInput 

  def validate_date(date)
    /\A\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])\z/.match(date)
  end
#edit code in git hub
  
  def valid_amount
    count=0
    begin
      amount= Float(gets.chomp)
    rescue ArgumentError
      print "Invalide amount try again: "
      retry
    end
    return amount
  end


  def valid_category
    count=0
    category= gets.chomp.strip
    while !/^[A-Za-z\s]+$/.match(category)
      count+=1
      if count==3
        puts "\nMultiple times invalid input"
        start_main
      end
      print "Invalide category try again: "
      category=gets.chomp.strip
    end
    return category
  end


  def valid_date
    count=0
    date = gets.chomp
    while date.empty? || !validate_date(date)
      count+=1
      if count==3
        puts "\nMultiple times invalid input"
        start_main
      end
      print "Invalide date please try again: "
      date = gets.chomp
    end 
    return date
  end
end

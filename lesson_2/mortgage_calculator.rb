# mortgage_calculator.rb

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_num?(num)
  num.to_i().to_s() == num && num.to_i() > 0
end

prompt("Welcome to the mortgage calculator!")

loop do
  loan = ''
  loop do
    prompt("How much money do you plan to borrow?")
    loan = Kernel.gets().chomp()

    if valid_num?(loan)
      break
    else
      prompt("Sorry that is not a valid number. Please enter a positive number.")
    end
  end

  apr = ''
  loop do
    prompt("What APR percentage would you like to calculate? Ex. '5' for 5%, '4' for 4%")
    apr = Kernel.gets().chomp()

    if valid_num?(apr)
      break
    else
      prompt("Sorry that is not a valid number. Please enter a positive number.")
    end
  end

  term = ''
  loop do
    prompt("How long is your projected repayment period (in years)")
    term = Kernel.gets().chomp()

    if valid_num?(term)
      break
    else
      prompt("Sorry that is not a valid number. Please enter a positive number.")
    end
  end

  apr_percent = apr.to_f() * 0.01
  monthly_interest = apr_percent / 12.00
  term_months = term.to_i() * 12

  monthly_payment = loan.to_f() * (monthly_interest / (1 - (1 + monthly_interest)**-term_months.to_i()))

  prompt("Your monthly payment for this mortgage would be $#{monthly_payment.round(2)}")

  prompt("Would you like to run another calculation? Enter 'y' for Yes.")
  answer = Kernel.gets().chomp()
  break unless answer.downcase() == 'y'
end

prompt("Thank you for using the mortgage calculator!")

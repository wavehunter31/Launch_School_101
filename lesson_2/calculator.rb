# calculator.rb

# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

LANGUAGE = 'en'

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt(messages('welcome', LANGUAGE))

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(messages('valid_name', LANGUAGE))
  else
    break
  end
end

prompt("Hi #{name}")

loop do # main loop
  number1 = ''
  number2 = ''
  
  loop do
    prompt(messages('num1', LANGUAGE))
    number1 = Kernel.gets().chomp()
    if valid_number?(number1)
      break
    else
      prompt(messages('num_error', LANGUAGE))
    end
  end

  loop do
    prompt(messages('num2', LANGUAGE))
    number2 = Kernel.gets().chomp()
    if valid_number?(number1)
      break
    else
      prompt(messages('num_error', LANGUAGE))
    end
  end

  prompt(messages('choose_operation', LANGUAGE))

  operation = ''
  loop do
    operation = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt(messages('operation_error', LANGUAGE))
    end
  end

  prompt("#{operation_to_message(operation)} the two numbers...")

  result =  case operation
            when '1'
                result = number1.to_i() + number2.to_i()
            when '2'
                result = number1.to_i() - number2.to_i()
            when '3'
                result = number1.to_i() * number2.to_i()
            when '4'
                result = number1.to_f() / number2.to_f()
            end

  prompt("The result is #{result}")

  prompt(messages('request_again', LANGUAGE))
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(messages('thank_you', LANGUAGE))

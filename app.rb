require "sinatra"
require "sinatra/reloader"

# get("/howdy") do
#  erb(:hello)
# end

# get("/goodbye") do
#  erb(:bye)
# end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @square_num = params.fetch("square_number").to_f

  @square_result = @square_num ** 2 
  # ** is the exponentiation operator

  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @square_root_num = params.fetch("users_num").to_f

  @square_root_result = Math.sqrt(@square_root_num)

  erb(:square_root_results)
end

get("/payment/new") do
  erb(:new_payment_calc)
end

get("/payment/results") do
  # Step 1: Fetch the APR from params and convert it to a float
  apr_str = params.fetch("APR")
  annual_rate = apr_str.to_f

  # Step 2: Convert the APR from a percentage to a decimal
  annual_interest_rate = annual_rate / 100

  # Step 3: Divide by 12 to get the monthly interest rate
  monthly_interest_rate = annual_interest_rate / 12

  # Step 4: Fetch the number of years, convert to an integer, and multiply by 12 for monthly periods
  years_str = params.fetch("years")
  years = years_str.to_i
  n = years * 12

  # Step 5: Fetch the principal amount and convert it to a float
  principal_str = params.fetch("principal")
  principal_val = principal_str.to_f

  # Step 6: Calculate the numerator and denominator
  numerator = monthly_interest_rate * principal_val
  denominator = 1 - ((1 + monthly_interest_rate) ** -n)

  # Step 7: Calculate the monthly payment by dividing the numerator by the denominator
  monthly_payment = numerator / denominator

  # Format the result as currency
  @formatted_payment = monthly_payment.to_fs(:currency)

  # The following instance variables are not part of the monthly payment calculation,
  # but they are used to display the inputs back to the user on the results page.
  @formatted_apr = annual_interest_rate.round(5).to_s + "%"
  @years_num = years
  @formatted_principal = principal_val.to_fs(:currency)

  erb(:payment_results)
end

get("/random/new") do
  erb(:new_random_calc)
end

get("/random/results") do
  @minimum_num = params.fetch("minimum").to_f

  @maximum_num = params.fetch("maximum").to_f

  @random_result = rand(@minimum_num.to_f..@maximum_num.to_f).round(15)

  erb(:random_results)
end

# params.inspect code:

# get("/random/results") do
#   # Inspect the params hash and print it to the server logs for debugging
#   puts "Params: #{params.inspect}"
  
#   # Temporary code to display params in the browser for inspection
#   "Params: #{params.inspect}"
# end

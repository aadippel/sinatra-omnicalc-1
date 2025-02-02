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
  @square_num = params.fetch("square_number").to_i

  @square_result = @square_num.to_f ** 2 
  # ** is the exponentiation operator

  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @square_root_num = params.fetch("users_number").to_i

  @square_result = Math.sqrt(@square_root_num).to_f

  erb(:square_root_results)
end

get("/payment/new") do
  erb(:new_payment_calc)
end

get("/payment/results") do
  @apr_num = params.fetch("APR").to_fs(:percentage, {:precision => 4})

  @years_num = params.fetch("years").to_i

  @principal_num = params.fetch("principal").to_fs(:number, {:precision => 2})

  @payment_result = @apr_num * @years_num * @principal_num

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

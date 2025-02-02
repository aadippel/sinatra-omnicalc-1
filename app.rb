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
  @square_num = params.fetch("users_number").to_i

  @square_result = @square_num.to_f ** 2 # ** is the exponentiation operator

  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @square_root_num = params.fetch("users_number").to_i #correct

  @square_result = Math.sqrt(@square_root_num).to_f

  erb(:square_root_results)
end

get("/payment/new") do
  erb(:new_payment_calc)
end

get("/payment/results") do
  @apr_num = @apr_num..to_fs(:percentage, {:precision => 4}) #correct

  @years_num = @years_num.to_i #correct

  @principal_num = @principal_num.to_fs #correct

  erb(:square_root_results)
end

get("/random/new") do
  erb(:new_random_calc)
end

get("/random/results") do
  @minimum_num = @minimum_num.to_f #correct

  @maximum_num = @maximum_num.to_f #correct

  @random_result = rand(@minimum_num..@maximum_num).to_fs(:precision => 15) #correct

  erb(:random_results)
end

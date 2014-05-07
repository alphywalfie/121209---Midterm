require 'sinatra'
require './expense'

expenses = []

get '/' do	
	@expenses = expenses
	erb :index
	#SHOWING ALL EXPENSE INSTANCES STORED IN THE LOCAL ARRAY CALLED 'expenses'
end

get '/new' do
	erb :new
end
	#contains a form that will ask the user to enter only the item and amount of a given expense record. The form should perform a POST action against the route 'save' and that will save the record of the item to the array of expenses. The code to add an instance to an array is as follows

post '/save' do
	last_expense = expenses.last
	if last_expense == nil
		expense = Expense.new(1, params[:item], params[:amount])
		expenses << expense
 else
		expense = Expense.new(expenses.last.id + 1, params[:item], params[:amount])
		expenses << expense
	end
	redirect to '/'
end

get '/show/:id' do
	index = params[:id]
	@expense = expenses[index - 1]
	erb :show
end

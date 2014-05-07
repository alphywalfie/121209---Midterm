class Expense
	attr_accessor :id, :item, :amount

	def initialize (id, item, amount)
		self.id = id
		self.item = item
		self.amount = amount
	end
end

#ID is an int, item is a string, amount is a decimal/float

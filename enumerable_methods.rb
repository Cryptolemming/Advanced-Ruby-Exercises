module Enumerable

	def my_each
		for i in self
			yield(i)
		end
	end

	def my_each_with_index
		index = 0
		for i in self
			yield(i, index)
			index += 1
		end
	end

	def my_select
		result = []
		self.my_each {|i| result << i if yield(i)}
		result
	end

	def my_all?
		result = true
		self.my_each {|i| result = false unless yield(i)}
		result
	end

	def my_any?
		result = false
		self.my_each {|i| result = true if yield(i)}
		result
	end

	def my_count
		count = 0
		if block_given?
			self.my_each {|i| count += 1 if yield(i)}
		else 
			self.my_each {|i| count += 1}
		end
		count
	end

	def my_map proc=nil
    	array = []
    	if proc && block_given?
      		self.my_each { |i| array << proc.call(yield(i)) }
    	elsif block_given?
      		self.my_each { |i| array << yield(i) }
    	else
      		self.my_each { |i| array << proc.call(i) }
    	end
    	array
    end

    def my_inject val, &block
    result = val
    self.my_each { |i| result = yield(result,i) }
    result
  end


end

a = [1, 2, 3, 4, 5]
puts a
puts "-------------------"
puts a.my_each {|i| i * 5}
puts "-------------------"
puts a.my_each_with_index {|a, b| "#{a}, #{b}"}
puts "-------------------"
puts a.my_select {|i| i % 2 == 0}
puts "-------------------"
puts a.my_all? {|i| i.even?}
puts a.my_all? {|i| i < 6}
puts "-------------------"
puts a.my_any? {|i| i.even?}
puts "-------------------"
puts a.my_count
puts a.my_count {|i| i.even?}
puts "-------------------"
puts a.my_map {|i| i*2}
puts "-------------------"
puts a.my_inject(1) {|result, i| result*i}
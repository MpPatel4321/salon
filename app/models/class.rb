class B 
	def test
		puts "b"
	end
end
class A < B
	def test
		puts "a"
	end
	def test1
		test
	end
end

a = A.new
a.test1
# a.test
require './lib/blocks.rb'

describe 'Blocks' do
	context 'Map' do
		it "should fail unless it is passed an array" do
			a = String.new
			expect {a.map}.to raise_error
			# could use old syntax
			# lambda {a.map}.should raise_error
			# or
			# expect(lambda {a.map}).to raise_error
		end
		it "should output an array if you pass it a block" do
			a = []
			expect(a.map {|x| x} .class).to be Array 
		end
		it "should invoke the block once for each element" do
			a = [1,2,3]
			expect(a.map {|x| 2*x }).to eq [2,4,6]
		end
		it "should return an enumerator if no block is given" do
		a = []
		expect(a.map.class).to be Enumerator
		end
		it "should be able to use a proc instead of a block" do
			my_proc = Proc.new {|a| a * 2}
			result = [1,2,3].map(&my_proc)
			expect(result).to eq [2,4,6]
		end
	end
	context 'Select' do
		it "should fail if not passed an array" do
			a = String.new
			expect {a.select}.to raise_error	
		end
		it "should return an array containing all elements of the original array which are true" do
			a = [1,2,3]
			expect(a.select {|x| x.even?}).to eq [2]
		end
		it "should return an enumerator if no block is given" do
			a = []
			expect(a.select.class).to be Enumerator
		end
	end
	context "Each" do
		it "should invoke a block once for each element" do
			a = [3,4,5]
			b = []
			c = []
			a.each {|x| b << x * 2}
			for i in a
				c << i * 2
			end 
			expect(b).to eq c
		end
		it "should return an enumerator if no block is given" do
			a = []
			expect(a.each.class).to be Enumerator
		end
	end
end	


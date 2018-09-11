# When done, submit this entire file to the autograder.

# Part 1

#intital value is set to 0 and sum operation is carried out on the array. 
#This is Enumerable type inject.
def sum arr
  arr.inject(0, :+)                                                             
end

#sort the array in asc order and take sum of last 2 elements
def max_2_sum arr
  sum(arr.sort.last(2))                                                         
end

#most ruby to do it would be to use 1.3
#product gives a cartesian product. Once we get that we can use any? to check all the cartesian pairs which sum up to n. 
#But this approach will fail for one of the cases where array might have duplicate values.
#for instance let arr=[1,2,4,4] and n be 8, 1.3  will fail this test, since it will eliminate 4,4 duplet because of c[0] != c[1].
#which was put in order to consider for e.g. [1,2,4] and 8, where 4,4 might come as true.
# A better approach would be to use derivate of DNF algorithm to optimize the search time and cover all cases.
def sum_to_n? arr, n
  #arr.product(arr).any? {|c| sum(c) == n && c[0] != c[1] }    ----1.3
  arr = arr.sort
  low = 0
  high = arr.length - 1
  while low < high
    if arr[low] + arr[high] == n
      return true
    end
    arr[low] + arr[high] < n ? low += 1 : high -=  1 
  end
  return false
end

# Part 2

def hello(name)
  "Hello, " + name
end

#first ^acts as a not, second ^ inside [ acts as a starts with, \W is included for non-word character and finally /i is to make it case insensitive.
def starts_with_consonant? s
  s =~ /^[^aeiou\W]/i
end

#String should only have 0's and 1's and end in 00 to be a multiple of 4
#0 is also a multiple of 4
def binary_multiple_of_4? s
  s =~ /(^0|^[10]*00)$/             
end

# Part 3

class BookInStock
  
  attr_accessor :isbn                                     #getter, setter for isbn
	attr_accessor :price                                    #getter, setter for price

	def initialize(isbn, price)
		raise ArgumentError, 
		  "Illegal Argument" if isbn.empty?  or price <= 0    #raise an error if isbn is an empty string or price is less than or  equal to zero
		@isbn = isbn                                          #intialize isbn
		@price = price                                        #intialize price
	end

	def price_as_string
		sprintf("$%2.2f", @price)                             #prepend @price with $ and convert it to  2.2f i.e. float with 2  decimal point formt
	end
	
end

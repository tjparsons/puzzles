 puts "12 men, all but one of equal weight.\nUse a seesaw only 3 times to find the oddball & determine if he is heavier or lighter.\n"
 w=Array.new(12,100)
 w[rand(0...12)]+=[5,-5].sample
 # w[4]-=5
 puts "Split into three groups:\na = #{w[0..3]}, b = #{w[4..7]}, c = #{w[8..11]}"
 puts "~~~~~~~~~~~~~~~~~~~~\nfirst use of seesaw\n~~~~~~~~~~~~~~~~~~~~"
 puts "group a: #{w[0..3]} vs group b: #{w[4..7]}"
 puts ["right side of seesaw lower","seesaw balanced","left side of seesaw lower"][(r1=w[0..3].reduce(:+)<=>w[4..7].reduce(:+))+1]
 # it's a seesaw, say left side lighter or heavier for clarity if that's possible in this case
 if r1==0
 	puts "oddball in group c: #{w[8..11]}"
 	puts "~~~~~~~~~~~~~~~~~~~\nsecond use of seesaw\n~~~~~~~~~~~~~~~~~~~"
 	puts "group c(1,2,3): #{w[8..10]} vs group a(1,2,3): #{w[0..2]}"
 	puts ["right side of seesaw lower","seesaw balanced","left side of seesaw lower"][(r2=w[8..10].reduce(:+)<=>w[0..2].reduce(:+))+1]
 	puts "group c(1,2,3) is "+["lighter","equal","heavier"][r2+1]
 	if r2==0
 		puts "oddball c(4): #{w[11]}"
 		puts "~~~~~~~~~~~~~~~~~~~\nthird use of seesaw\n~~~~~~~~~~~~~~~~~~~"
 		puts "c4: #{w[11]} vs a1: #{w[0]}"
 		puts w[11]<w[0] ? "right side of seesaw lower\nc4 is lighter" : "left side of seesaw lower\nc4 is heavier"
 	else
 		puts "oddball is in c(1,2,3): #{w[8..10]}"
 		puts "~~~~~~~~~~~~~~~~~~~\nthird use of seesaw\n~~~~~~~~~~~~~~~~~~~~"
 		puts "c1: #{w[8]} vs c2: #{w[9]}"
 		h_l= r2==1 ? ["heavier",w[9],w[8],"left","right"] : ["lighter",w[8],w[9],"right","left"]
 		puts ["#{h_l[3]} side is lower\nc1 is #{h_l[0]}", "seesaw balanced\nc3 is #{h_l[0]}", "#{h_l[4]} side is lower\nc2 is #{h_l[0]}"][(h_l[1]<=>h_l[2])+1]
	end
 else # group a != group b, group c all equal
 	puts "oddball is in group a or b"
 	puts "~~~~~~~~~~~~~~~~~~~~\nsecond use of seesaw\n~~~~~~~~~~~~~~~~~~~~"
 	puts "group a(1,2,),b1: #{w.values_at(0,1,4)} vs group a(3,4),b2: #{w.values_at(2,3,5)}"
 	r2=w.values_at(0,1,4).reduce(:+)<=>w.values_at(2,3,5).reduce(:+)
 	if r2==0 # oddball is b3 or b4
 		puts "seesaw now balanced\noddball is b3 or b4\n~~~~~~~~~~~~~~~~~~~\nthird use of seesaw\n~~~~~~~~~~~~~~~~~~"
 		puts "b3: #{w[6]} vs c1: #{w[8]}"
 		r3=w[6]<=>w[8]
 		puts r3==0 ? r1==-1 ? "seesaw balanced\nb4 heavier" : "seesaw balanced\nb4 lighter" : r3==-1 ? "right side lower\nb3 lighter" : "left side lower\nb3 heavier"
 	else # oddball is group a or b3 or b4. if unbalanced side same in r1 & r2, oddball is a1,a2 or b2. else the other 3.
 		puts r2==1 ? "left side of seesaw lower" : "right side of seesaw lower"
 		if r1==r2 # seesaw unbalanced on same side
 			puts "balance unchanged, oddball is a1, a2 or b2"
 			puts "~~~~~~~~~~~~~~~~~~\nthird use of seesaw\n~~~~~~~~~~~~~~~~~\na1: #{w[0]} vs a2: #{w[1]}"
 			puts ["right side of seesaw lower","seesaw balanced","left side of seesaw lower"][(r3=w[0]<=>w[1])+1]
 			puts r3==r2 ? "balance unchanged" : "balance changed"
 			puts r2==1 ? ["a2 is heavier", "a1 & a2 equal, b2 is lighter", "a1 is heavier"][r3+1] : ["a1 is lighter", "a1 & a2 equal, b2 is heavier", "a2 is lighter"][r3+1]
 		else # seesaw unbalanced side changed
 			puts "balance changed, oddball is a3, a4, or b1"
 			puts "~~~~~~~~~~~~~~~~~~\nthird use of seesaw\n~~~~~~~~~~~~~~~~~\na3: #{w[2]} vs a4: #{w[3]}"
 			puts ["right side of seesaw lower","seesaw balanced","left side of seesaw lower"][(r3=w[2]<=>w[3])+1]
 			puts r3==r2 ? "balance unchanged" : "balance changed"
 			puts r2==1 ? ["a3 is lighter", "a3 & a4 equal, b1 is heavier", "a4 is lighter"][r3+1] : ["a4 is heavier", "a3 & a4 equal, b1 is lighter", "a3 is heavier"][r3+1]
 		end
 	end
 end
 puts "\nnow go watch brooklyn 99"



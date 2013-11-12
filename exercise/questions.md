Course 1:

  + Q: is there an no arg block?  
    A: yes, refer to [example 1](#e1).

  + Q: can we pass multi blocks to a function  
    A: yes, please look to [example 2](#e2).

  + Q: yield faster than block.call?  
    A: yes,  yield is more efficient, because it doesn't have to first create a Proc object and then invoke its call method.

  + Q: what's the block disadvantage?

###Code examles:
######[example 1](id: e1):
    now = Proc.new { Time.now }
    now.call


###### [example 2](id: e2):
    add1 = Proc.new { |x| x + 1}
    add2 = Proc.new { |x| x + 2 }
    def combine(p1, p2, x)
      p1.call(x) + p2.call(x)
    end
    combine(add1, add2, 1) #should return 5
    #references: http://ruby-china.org/topics/10414



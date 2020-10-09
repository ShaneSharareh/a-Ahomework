class Queue
    def initialize
        @queue = []
    end

    def enqueue(el) 
        @queue.push(el)
    end
    def dequeue
        @queue.length > 0 ? (@queue.shift) : (raise "Queue is Empty!") 
    end 
    def peek
        @queue.length > 0 ? (@queue[0]) : (raise "Queue is Empty!") 
    end
end
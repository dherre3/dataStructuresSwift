
/*
 * Implementation of the heap data structure with the purpose of showing its running times and building up towards heapsort, simple implementation using ints but it could be used with pretty much any data structure
 */

struct MaxHeap {
    //Main data structure for the heap class
    static func buildMaxHeap (inout array:[Int])
    {
        var i = array.count/2
        while (i >= 1)
        {
            siftDown(&array, index:i,size: array.count)
            i -= 1
        }
    }
    
    //Heap sort
    static func heapSort(inout array:[Int])
    {
        buildMaxHeap(&array)
        var sizeheap = array.count
        for i in array.count.stride(through: 2, by: -1){
            let a = array[i-1]
            array[i-1] = array[0]
            array[0] = a
            sizeheap-=1
            siftDown(&array, index:1,size:sizeheap )
        }
    }
    //Get parent
    func parent(index:Int)->Int
    {
        return index/2
    }
    //Get left child
    static func leftChild(i:Int)->Int
    {
        return 2*i
    }
    //Get right child
    static func rightChild(i:Int)->Int
    {
        return 2*i+1
       
    }
    //Gets maximum element in priority queue without removing
    /*func getMax()-> Int
    {
        if mainArray.count>0
        {
            //Returns the element at the root of heap tree
            return mainArray[0]
        }else{
            //Return minus infinity, should just throw an error but this is simple enough for now
            return -1*NSIntegerMax
        }
        
    }*/
    
    //Inserting into a heap
    func insert(val:Int){
        
    }
    
    //For Maintaining max-heap property, moves node up if larger than parent
    func siftUp(inout mainArray:[Int], i:Int)
    {
        var i = i
        if i < mainArray.count
        {
            var par = mainArray[parent(i)]
            var largest = mainArray[i];
            while par < largest && i != 0
            {
                largest = mainArray[i]
                par = mainArray[parent(i)]
                let tmp = par;
                mainArray[parent(i)] = largest
                mainArray[i]=tmp
                i = parent(i)
            }
        }
    }
    
    //Actually removes element, first it removes root then replaces with child, or mainArray[size_heap] then
    //it sifts the node down
    func extractMax()
    {
        
    }
    
    //Maining max-heap property by going down the tree
    static func siftDown(inout mainArray:[Int],index:Int, size:Int)
    {
        let i = index
        let left = leftChild(i)
        let right = rightChild(i)
        var largest = i
        if (left <= size && mainArray[left-1] > mainArray[largest-1])
        {
            largest = left
        }
        if (right <= size && mainArray[right-1] > mainArray[largest-1])
        {
            
            largest = right
        }
        if largest != i
        {
            let tmp = mainArray[largest-1]
            mainArray[largest-1] = mainArray[i-1]
            mainArray[i-1] = tmp
            siftDown(&mainArray, index: largest,size: size)
        }
    }
    
    //Changing the priority of an element, switch priority then sift up or down depending on its status
    func changePriority()
    {
        
    }
    
    //Replace element with a leaf node then max-heapify the leaf
    func remove()
    {
        
    }
    
    //Heap print
    func printHeap()
    {
        print()
    }
}
var a = [30,23, 14,42, 12, 7, 8, ]
//MaxHeap.buildMaxHeap(&a)
MaxHeap.heapSort(&a)
print(a)


/*heap.siftDown(1)
heap.siftUp(2)*/
//heap.printHeap()

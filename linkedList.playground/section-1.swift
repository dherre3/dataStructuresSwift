// Playground - noun: a place where people can play
/*
* Code author: David Herrera 
* Date :       27/03/2016
*/
import UIKit

var str = "Hello, playground"

class LinkedList {
    //Head of list
    var head:Node
    
    //Constructor
    init(val: Int)
    {
        let head = Node(val: val)
        self.head = head
    }
    //Inserting node helper function, recursive solution
    private func insertNode(insertVal:Int, prevNode: Node?, nextNode: Node?) {
        if let prev = prevNode {
            if let valHead = nextNode {
                let val = valHead.value
                if val < insertVal {
                    insertNode(insertVal, prevNode: valHead, nextNode: valHead.nextNode)
                }else{
                        let newNode = Node(val: insertVal)
                        prev.nextNode = newNode
                        newNode.nextNode = nextNode
                }
            }else {
                prev.nextNode = Node(val: insertVal)
            }
        }else {
            if nextNode!.value > insertVal {
                self.head  = Node(val: insertVal)
                self.head.nextNode = nextNode
            }else{
                insertNode(insertVal, prevNode: nextNode, nextNode: nextNode?.nextNode)
            }
        }
    }
    
    //Inserting node public method
    func insertNode(value: Int)
    {
        insertNode(value, prevNode: nil, nextNode: self.head)
    }

    //Printing list method
    func printList()
    {
        let resultString = printList("",newNode: self.head)
        print("\(resultString)")
    }
    
    //Printing list helper, recursive solution
    private func printList (resultString:String,newNode: Node) -> String
    {
        let result = resultString + "[\(String(newNode.value)),  -]->"
        if let new = newNode.nextNode
        {
            return printList(result, newNode: new)
        }else{
            return result
        }
    }
    
    //Searching list helper
    private func searchList(val:Int) -> Node?
    {
        return searchList(val, currentNode: self.head)
    }
    
    //Searchng list public method
    func searchList(val:Int, currentNode:Node?) -> Node?
    {
        if let current = currentNode {
            if current.value == val
            {
                return Node(newNode: current)
            }else {
                return searchList(val, currentNode: current.nextNode)
            }
        }else {
            return nil
        }
    }
    
    //Finding max value in linked list recursive
    func maxList() -> Int? {
        return performOperation(Int.max, currentNode: self.head, operation: >)
    }
    
    //Finding min value in linked list recursive
    func minList() -> Int? {
        return performOperation(Int.min, currentNode: self.head, operation: <)
    }
    
    //Helper for min and max, notice that it takes an operation that returns a boolean
    private func performOperation(max:Int, currentNode:Node?, operation:(Int, Int)-> Bool)->Int
    {
        if let current = currentNode {
            if operation(max,current.value){
                return performOperation(current.value, currentNode: current.nextNode,operation: operation)
            }else{
                return performOperation(max, currentNode: current.nextNode,operation: operation)
            }
        }else{
            return max
        }
    }
    
    //Public method to search list iteratively
    func listSeachIterative (key:Int)->Node?
    {
        if self.head.value == key
        {
            return self.head
        }else if (self.head.nextNode == nil) {
            return nil
        }
        var next:Node? = self.head.nextNode
        while (next != nil )
        {
            print("\(next)")
            if(next!.value == key)
            {
                break
            }
            if next!.nextNode != nil
            {
                next = next!.nextNode
            }else{
                next = nil
            }

        }
        return next
    }
    
    //Public method to delete node from list, input node in list
    func deleteFromLinkedList( node: Node)
    {
        var next = self.head
        var prev:Node? = nil
        
        while(next !== node)
        {
            
            if next.nextNode != nil
            {
                prev = next
                next = next.nextNode!
                
            }else{
                print("Node not found")
                return
            }
            
        }
        if prev != nil
        {
            prev?.nextNode = next.nextNode
        }else {
            self.head = next.nextNode!
        }
    }
    
}


//Node class
class Node {
     var value:Int = 0
     var nextNode: Node? = nil
    
    init( val: Int)
    {
        self.value = val
        self.nextNode = nil
    }
    //Constructor to copy node
    init(newNode: Node)
    {
        self.value=newNode.value
    }
   
}
//Creating a list
var list = LinkedList(val: 2)

//Inserting nodes into list
list.insertNode(4)
list.insertNode(3)
list.insertNode(3)
list.insertNode(-20)
list.insertNode(20)
list.insertNode(10)

//Deletes second node with key of 3
list.deleteFromLinkedList(list.head.nextNode!.nextNode!.nextNode!)

//Searching interatively and printing value
var lookUpIterative = list.listSeachIterative(-20)
print(lookUpIterative?.value)

//Searching for node value of 4, finds node

var firstNodeLookUp = list.searchList(4)
//Searching for node value of 5, returns nil
var secondNodeLookUp = list.searchList(5)

//Finding minimum and maximum key in linked list
var max = list.maxList()
print("Max is: \(max!)")

var min = list.minList()
print("Min is: \(min!)")

//Printing list
list.printList()


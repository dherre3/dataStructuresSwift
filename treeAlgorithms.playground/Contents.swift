//: Playground - noun: a place where people can play
//Author: David Herrera, Date: April 11 2016
import UIKit

var str = "Hello, playground"
//Simple node class for linked list implementation
class Node {
    var key:Double = 0.0
    var nextNode:Node?
    init(key:Double)
    {
        self.key = key;
        self.nextNode = nil
    }
    init(node:Node)
    {
        self.key = node.key
        self.nextNode = node.nextNode
    }
}
//
class LinkedList {
    
    var head:Node?
    var tail:Node?
    
    func pushFront (key:Double)
    {
        let newNode = Node(key: key)
        newNode.nextNode = self.head
        self.head = newNode
        if self.tail == nil {
            self.tail = self.head
        }
        
    }
    func popFront() -> Node?
    {
        if let head =  self.head
        {
          self.head = head.nextNode
          return head
        }
        return nil
    }
    func pushBack(key:Double)
    {
        let node = Node(key:key)
        if let tail = self.tail
        {
            tail.nextNode = node
            self.tail = node
        }else{
            self.head = node
            self.tail = node
        }
    }
    func popBack() -> Node?
    {
       
        if let head = self.head
        {
            if let tail = self.tail
            {
                if head === tail
                {
                    let node = Node(node: head)
                    self.head = nil
                    self.tail = nil
                    return node
                }else{
                    var p:Node = head
                    while p.nextNode?.nextNode !== nil
                    {
                        p = p.nextNode!
                    }
                    
                }
                
            }
        }
        
        return nil
    }
    init(node:Node)
    {
        self.head = node;
        self.tail = node;
    }
    init()
    {
        self.head = nil
        self.tail = nil
    }
    init(key:Double)
    {
        let nodeHead = Node(key:key)
        self.head = nodeHead
        self.tail = nodeHead
    }
    
    
}

/*
 *  NodeTree class
 */
public class NodeTree {
    //Key value
    var key:Int
    var parent:NodeTree?
    var left:NodeTree?
    var right:NodeTree?
    
    //Initializer for the class
    public init(key:Int)
    {
        self.key = key
    }
    
    //Print node function
    func printNodeTree()
    {
        print("key: \(key), Parent: \(parent?.key), Left:\(left?.key), Right:\(right?.key)")
    }
}
/*
 *  Stack implementation taking advantage of simple dynamic array data structure provided by swift, no really the need to make this data structure are all, but it helps to be clear
 */
class Stack<Element> {
    
    //Main data structure for our class
    private var mainArray = [Element]()
    private var pointer = 0
    //Init stack with node
    init(node:Element)
    {
        mainArray.append(node)
    }
    
    //Empty initialization
    init(){}
    
    //Check if stack is empty
    func isEmpty()->Bool
    {

       return  mainArray.isEmpty
    }
    
    //Pop NodeTree from the top
    func pop()-> Element?
    {
        if !mainArray.isEmpty{
           return mainArray.removeLast()
        }
        return nil
    }
    //Push NodeTree to top
    func push(node:Element)
    {
        mainArray.append(node)
    }
}



//Stacks Questions

//Question 1: For a given string, find whether the parenthesis are balanced return a boolean

func matchingParenthesis(string:String) ->Bool
{
    let stack = Stack<Character>()
    for character in string.characters {
        if (character == "{" || character == "[" || character == "(")
        {
            
           stack.push(character)
        
        }else if (character == "}" || character == "]" || character == ")"){
            if let char = stack.pop()
            {
                switch char {
                case "(":
                    if character != ")" {
                        return false
                    }
                    break;
                case "{":
                    
                    if character != "}" {
                        return false
                    }
                    break;
                case "[":
                    
                    if character != "]" {
                        return false
                    }
                    break;
                default:
                    
                    break;
                }
            }else{
                return false
            }
        }
    }
    return true
}
print(matchingParenthesis(""))
/*
 *Basic Queue class taking NodeTree, could be generalized to anything, but is simple enough for the Tree algorithms
 */
class Queue {
    //Main data structure
    var mainArray:[NodeTree]
    
    //Default Initializer
    init (){
        mainArray = []
    }
    
    //Initializer node tree
    init (node:NodeTree)
    {
        mainArray = [node]
    }
    
    //Function enqueue
    func enqueue(node:NodeTree)
    {
        mainArray.append(node)
    }
    
    //Checks whether queue is empty
    func isEmpty()->Bool
    {
        return mainArray.isEmpty
    }
    
    //Dequeue function
    func dequeue()->NodeTree?
    {
        if !mainArray.isEmpty
        {
            return mainArray.removeFirst()
        }
        return nil
        
    }
}

/*
 * Tree class implementation, the properties should be private but what should transcend are the basic operations performed on them and not the class design
 */
class Tree {
    
    //Properties of the tree class
    var root:NodeTree?

    //Intializer
    init(node: NodeTree)
    {
        root = node
    }
    
    init(){}
    
    //Pre order traversal iterative
    func preOrderIterative()
    {
        if let node = root
        {
            let stack = Stack<NodeTree>()
            stack.push(node)
            print(stack.isEmpty())
            while(!stack.isEmpty())
            {
               if let newNode = stack.pop()
               {
                    print(newNode.key)
                    if let right = newNode.right
                    {
                        stack.push(right)
                        
                    }
                    if let left = newNode.left
                    {
                        
                        stack.push(left)
                    }
               }
               
                
            }
        }
    }
    //In order traversal iteraive
    func inOrderIterative()
    {
        if let node = root
        {
            let stack = Stack(node:node)
            var left = node
            while !stack.isEmpty()
            {

                while left.left !== nil{
                    stack.push(left.left!)
                    left = left.left!
                }
                let popNode = stack.pop()
                print(popNode!.key)
                
                if let right = popNode!.right
                {
                    stack.push(right)
                    left = right
                }
            }
        }
    }
    
    //Recursive implementation of depth first search traversal alorithms
    func preOrderRecursive()
    {
        
        helperPreRecursive(root)
    }

    func inOrderRecursive()
    {
        helperInOrder(root)
    }
    func helperInOrder(node:NodeTree?)
    {
        if let nodeTree = node
        {
            
            helperInOrder(nodeTree.left)
            print("\(nodeTree.key)")
            helperInOrder(nodeTree.right)
        }
    }
    
    func helperPreRecursive(node:NodeTree?)
    {
        if let nodeTree = node
        {
            print("\(nodeTree.key)")
            helperPreRecursive(nodeTree.left)
            helperPreRecursive(nodeTree.right)
        }
    }
    
    
    //Height of a tree
    func heightTree()->Int
    {
        if root !== nil
        {
           return heightTree(root)-1
        }else{
           return 0
        }
        
    }
    func heightTree(nodeTree:NodeTree?)->Int
    {
        if let node = nodeTree
        {
            return 1 + max(heightTree(node.left),heightTree(node.right))
        }
        return 0
        
    }
    
    //BreathFirstSearch algorithm using a queue
    func breathFirstSearch()
    {
        if let node = self.root {
            let queue = Queue(node:node)
            while(!queue.isEmpty())
            {
                let printNode = queue.dequeue()
                print(printNode!.key)
                
                if let left = printNode!.left
                {
                    queue.enqueue(left)
                }
                if let right = printNode!.right
                {
                    queue.enqueue(right)
                }
            }
        }
        
    }
    
    //Print tree method to print the nodes in a tree using in Order Traversal
    func printTree()
    {
        printTree(root)
    }
    func printTree(nodeLook:NodeTree?)
    {
        if let node = nodeLook
        {
            
            printTree(node.left)
            node.printNodeTree()
            printTree(node.right)
        }
    }
}
/*
 * Implementation of the binary search tree class in swift
 */
class BinarySearchTree:Tree {
    
    
    //Inserting into a binary tree
    func insertNode(key:Int)
    {
        //Create node to be inserted
        let insertNode = NodeTree(key: key)
        
        
        var x:NodeTree? = root
        var y:NodeTree? = nil
        
        //Basically searches and stops at the place where the new node will be added 
        //keeping a reference to the parent node of that empty slot
        
        while x !== nil
        {
            y = x
            if (x!.key > key)
            {
                x = x!.left
            }else{
                x = x!.right
            }
        }
        //If y = nil then insert in root, otherwise inserted and change the parent 
        //reference to the new ndoe
        if y == nil {
            self.root = x
        }else if y!.key > key
        {
            y!.left = insertNode
            insertNode.parent = y
        }else{
            y!.right = insertNode
            insertNode.parent = y
        }
    }
    
    //Searching tree algorithm iteratively
    func searchTree(key:Int)->NodeTree?
    {
        //If the node being checked is not nil and the key as not found, go
        //down the tree until either you get to a nil place or you have found the key
        var node:NodeTree? = root
        while(node !== nil && node!.key != key)
        {
            if node!.key > key
            {
                node = node!.left
            }else{
                node = node!.right
            }
        }
        if node !== root
        {
            return node
        }else{
            if root !== nil && root!.key == key{
                return root
            }else{
               return nil
            }
        }
    }
    
    //Minumum operation in a binary tree, always go left
    func min()-> NodeTree?
    {
        return min(root)
    }
    func min (node:NodeTree?)->NodeTree?
    {
        var x = node
        while(x !== nil && x!.left !== nil)
        {
            x = x!.left!
        }
        return x
    }
    
    //Find the node with highest value in binary tree, always go right
    func max() -> NodeTree?
    {
        return max(root)
    }
    
    
    func max(node:NodeTree?) ->NodeTree?
    {
        var x = node
        while(x !== nil && x!.right !== nil)
        {
            x = x!.right!
        }
        return x
    }
    
    //Find the number of nodes in a binary tree, add one for all nodes
    //that are visited by going down the tree, recursive algorithm
    func nodeNumber( nodeLook:NodeTree?)->Int
    {
        if let node = nodeLook
        {
            return 1 + nodeNumber(node.left) + nodeNumber(node.right);
        }
        return 0
    }
    func nodeNumber()->Int
    {
        return nodeNumber(self.root)
    }
  
    //Find the node that has the smallest value higher than nodeLook,
    //If the node has a right child, simply find the minimum of the right subtree
    //Otherwise Go up until the parent is at the right of the searching node
    func successor (nodeLook:NodeTree?) -> NodeTree?
    {
        if let node = nodeLook
        {
            if node.right != nil
            {
                return min(node.right)
            }
            
            var x = node
            while x.parent != nil && x.parent!.right === x
            {
                x = x.parent!
            }
            
            return x.parent
        }
        return nil
       
    }
    //Find the node that has the largest value smaller than nodeLook in the tree,
    //If the node has a left child, simply find the maximum of the left subtree
    //Otherwise Go up until the parent is at the left of the searching node
    func predecessor (nodeLook:NodeTree?)->NodeTree?
    {
        if let node = nodeLook
        {
            if node.left != nil
            {
                return max(node.left)
            }
            var x = node
            
            while(x.parent !== nil && x.parent!.left === x)
            {
                x = x.parent!
            }
            return x.parent
            
        }
        return nil
        
    }
    //Deleting from a binary tree
    func deleteTreeNode(nodeLook:NodeTree?)
    {
        if let node = nodeLook
        {
            if node.left === nil && node.right === nil
            {
                if let parent = node.parent
                {
                    if parent.left === node
                    {
                        parent.left = nil
                    }else{
                        parent.right = nil
                    }
                }else{
                    root = nil
                }
              
            }else if node.left === nil && node.right !== nil
            {
                let right = node.right!
                if let parent = node.parent
                {
                    right.parent = parent
                    if parent.right === node
                    {
                      parent.right = right
                    }else{
                       parent.left = right
                    }
                    
                }else{
                   right.parent = nil
                    root = right
                }
                
            }else if node.left !== nil && node.right === nil
            {
                let left = node.left!
                if let parent = node.parent
                {
                    left.parent = parent
                    if parent.left === node
                    {
                        parent.left = left
                    }else{
                        parent.right = left
                    }
                    
                }else{
                    left.parent = nil
                    root = left
                }
            }else if (node.left !== nil && node.right !== nil)
            {
                
                let nodeHigherBottom = successor(node)
                nodeHigherBottom!.left = node.left
                nodeHigherBottom!.right = node.right
                node.left!.parent = nodeHigherBottom
                node.right!.parent = nodeHigherBottom
                nodeHigherBottom!.key
                if nodeHigherBottom!.parent!.left === nodeHigherBottom
                {
                   nodeHigherBottom!.parent!.left = nil
                }else{
                   nodeHigherBottom!.parent!.right = nil
                }
                if node.parent !== nil
                {
                    if node.parent!.left === node
                    {
                        node.parent!.left = nodeHigherBottom
                        
                    }else{
                        node.parent!.right = nodeHigherBottom
                    }
                    nodeHigherBottom!.parent = node.parent
                }else{
                    root = nodeHigherBottom
                    nodeHigherBottom!.parent = nil
                }
               
                
               
                /*nodeHigherBottom!.right = node.right*/
            }
            
            node.right = nil
            node.left = nil
            node.parent = nil
        }
    }
    
}

/*
            5
    3              7
2       4       6       8
              */ //If there are no left children, If parent.right = node return parent, otherwise return nothing. If there are left children, go left and then as right as possible.
var root = NodeTree(key: 5)
root.left = NodeTree(key: 3)
root.right = NodeTree(key:7)
root.right!.right = NodeTree(key:8)
root.right!.left = NodeTree(key:6)
root.left!.left = NodeTree(key:2)
root.left!.right = NodeTree(key:4)
var tree = Tree(node:root)
/*//In Order Traversal
 tree.inOrderRecursive()
 
 //Pre Order traversal
 tree.preOrderRecursive()*/
//tree.preOrderRecursive()
//tree.inOrderIterative()
//tree.depthTraversal()
//tree.preOrderIterative()

//Initializing BinarySearchTree
var bTree = BinarySearchTree(node:NodeTree(key:5))
//Inserting values into binary tree
bTree.insertNode(3)
bTree.insertNode(4)
bTree.insertNode(2)
////bTree.searchTree(3)!.right!.key
bTree.insertNode(7)
bTree.insertNode(8)
bTree.insertNode(6)


//bTree.deleteTreeNode(bTree.searchTree(5))
bTree.deleteTreeNode(bTree.searchTree(3))
bTree.deleteTreeNode(bTree.searchTree(6))
bTree.deleteTreeNode(bTree.searchTree(7))
bTree.deleteTreeNode(bTree.searchTree(8))
bTree.deleteTreeNode(bTree.searchTree(5))
//bTree.deleteTreeNode(bTree.searchTree(2))

//bTree.root!.right?.key
//In order traversal
//bTree.inOrderIterative()
//bTree.deleteTreeNode(bTree.searchTree(3))
//bTree.deleteTreeNode(bTree.searchTree(5))
//bTree.deleteTreeNode(bTree.searchTree(7))
//bTree.root!.key
//bTree.deleteTreeNode(bTree.searchTree(2))
//bTree.deleteTreeNode(bTree.searchTree(3))
bTree.deleteTreeNode(bTree.searchTree(4))

//bTree.root!.left!.key

bTree.printTree()



//bTree.root!.key
//bTree.searchTree(7)!.right!.key
bTree.nodeNumber()
//bTree.root!.right!.key
//bTree.deleteTreeNode(bTree.searchTree(6))
bTree.inOrderIterative()

//Searching binary tree
//bTree.searchTree(2)?.printNodeTree()
//bTree.predecessor(bTree.searchTree(5)!)?.key





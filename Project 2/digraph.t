
/////////////////////////////////// digraph.t /////////////////////////////////
//
// file name          : digraph.t
//
// This file contains contains the implementations of the templated graph functions
//
// Programmer         : B.J. STRELLER AND Jesse Adamu
//
// Date created       : 
//
// Date last revised  :
//
///////////////////////////////////////////////////////////////////////////////




#ifndef DIGRAPH_T
#define DIGRAPH_T


#include<iostream>
using std::cin;
using std::cout;
using std::cerr;
using std::endl;
using std::ws;
using std::ios;
using std::ostream;


#include<fstream>
using std::ifstream;

#include<string>
using std::string;

#include<cctype>



#include<list>
#include<vector>
#include<queue>
#include<stack>
#include<conio.h>							//for getche()
#include "digraph.h"







/////////////////////////////////// Digraph ///////////////////////////////////
//
// function name      : Digraph
//
// purpose            : constructor
//
// input parameters   : none
//
// output parameters  : none
//
// return value       : none
//
///////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
Digraph<V, W>::Digraph()
{
    num_of_verticies = 0;
}



/////////////////////////////////// ~Digraph //////////////////////////////////
//
// function name      : ~Digraph
//
// purpose            : destructor
//
// input parameters   : none
//
// output parameters  : none
//
// return value       : none
//
///////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
Digraph<V, W>:: ~Digraph()
{
    
}



/////////////////////////////////// set_size //////////////////////////////////
//
// function name      : set_size
//
// purpose            : determines the  number of lines in the input file; 
//						ie the number of verticies in the graph
//
// input parameters   : none
//
// output parameters  : one called inFile
//
// return value       : none
//
///////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
void Digraph<V, W>::set_size(ifstream& inFile)
{
	int counter(0);
    string line;
    while(getline(inFile, line))
    {
        counter++;
    }

    inFile.clear();
    
}



/////////////////////////////////// get_size //////////////////////////////////
//
// function name      : get_size
//
// purpose            : gets the size of the "array" which holds the verticies 
//						of the graph
//
// input parameters   : none
//
// output parameters  : none
//
// return value       : num_of_verticies of type int
//
///////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
int  Digraph<V, W>::get_size()
{
	
	return num_of_verticies; //cuz the stub needs something to return
}


/////////////////////////////////// getDigraph ////////////////////////////////
//
// function name      : getDigraph
//
// purpose            : retrives the input file info and stores it as a vector. 
//						The graph is stored implicitly in file
//
// input parameters   : none
//
// output parameters  : one called inFile
//
// return value       : none
//
///////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
void Digraph<V, W>::getDigraph(ifstream& inFile)
{

	vertex<V, W>  v;
	edge_representation<V, W> e;
	std::list< edge_representation<V, W> > edgeList;
	std::vector<vertex<V, W> > graph;

    string file;
    cout << "Please enter file path: ";
    cin >> file; 
    getline(cin, file);
    while (true)                    // user have unlimited chances to enter.
    {
        inFile.open(file);
        if (!inFile.fail()) break;  // if open fail, user can try again.
        cout << "Can't locate the file, please re-enter file path: ";
        getline(cin, file);
    }          

    V starting, ending;              // starting vertex and ending vertex
    W weight;                        // weight between two vertices
    char endMark = char{};           // to detect '#' character
    // Setup the graph ADT from data in given graph file:
    while (inFile >> starting)          // for each line, first read starting vertex.
    {
        while (true)                    // then repeatedly load ending vertex and weight
        {
            // Case 1: If the starting vertex has no edge at all:
            inFile >> ws;               // eat up any leading white spaces
            if (inFile.peek() == '#')   // check if end mark exists
            {
                inFile.get(endMark); // discard the end mark
                break;                  // stop loading
            }
            
            inFile >> ending >> weight;  // Load ending vertex and its weight:
            addUniEdge(starting, ending, weight); // add directed edge
            // Case 2: If reach the '#' symbol at line end:
            inFile >> ws;                // eat up any leading white spaces
            if (inFile.peek() == '#')    // check if end mark exists
            {
                inFile.get(endMark);  // discard the end mark
                break;                   // stop loading
            }
        }
    }
}




/////////////////////////////////// isVertex //////////////////////////////////
//
// function name      : isVertex
//
// purpose            : determines whether input is a vertex in the graph. 
//						Returns the index/location if in;otherwise returns -666
//
// input parameters   : none
//
// output parameters  : one of type V, called v
//
// return value       : an int
//
///////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
int Digraph<V, W>::isVertex(V& v)
{
	                     /*index of v in main graph vector*/
    for (int i = 0; i < num_of_verticies; i++)                // for each vertex in main graph vector
    {
        if (graph_array[i].name == v) return i;    // return index if a vertex name matches v
    }
    return -666;                          // indicate no such vertex in graph

}





/////////////////////////////////// isUniEdge /////////////////////////////////
//
// function name      : isUniEdge 
//
// purpose            : determines if the edge from v1 to v2 is an edge in the 
//						graph. Returns the location or index of the first vertex 
//						v1 if the edge is present in the graph; 
//						otherwise returns -666
//
// input parameters   : none
//
// output parameters  : two of type V, called v1 and v2
//
// return value       : an int - the index/location of the start vertex if 
//						it's present in the graph; otherwise -666
//
///////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
int Digraph<V, W>::isUniEdge(V& v1, V& v2)
{
    int index = isVertex(v1);                          // index of v1 in main graph vector
    if (index != -666)                    // for each vertex in main graph vector
    {
        for (typename std::list<edge_representation<V, W>>::iterator it = graph_array[index].edgeList.begin(); it != graph_array[index].edgeList.end(); ++it)
        {
            if (it->name == v2) return index;
        }
       
        
    }
    return -666;                              // indicate no such edge in graph
}





/////////////////////////////////// isBiDirEdge ///////////////////////////////
//
// function name      : isBiDirEdge
//
// purpose            : determines if there is an edge from v1 to v2 and 
//						from v2 to v1 in the graph. Returns the location
//                      or index of the first vertex v1 if the edge is present 
//						in the graph; otherwise returns -666
//
// input parameters   : none
//
// output parameters  : two of type V, called v1 and v2
//
// return value       : an int - the index/location of the start vertex if it's 
//						present in the graph; otherwise -666
//
///////////////////////////////////////////////////////////////////////////////




template< typename V, typename W >
int Digraph<V, W>::isBiDirEdge(V& v1, V& v2)
{
	if (isUniEdge(v2, v1) != -666)     // check if <v1,v2> edge exists
        return isUniEdge(v1, v2);    // check if <v2,v1> edge exists
    return -666;

}





/////////////////////////////////// addVertex /////////////////////////////////
//
// function name      : addVertex
//
// purpose            : adds a vertex to the graph if it's not there
//
// input parameters   : none
//
// output parameters  : one of type V, called v
//
// return value       : an int; the location/index of the vertex if added; 
//						otherwise -666
//
///////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
int Digraph<V, W>::addVertex(V& v)
{
	if (isVertex(v) == -666)   // only add if v doesn't exist in graph
    {

        vertex<V, W> newV;     // construct a new vertex object with v
        newV.name = v;
        graph_array.push_back(newV);      // add it into main graph vector
        num_of_verticies++; // the index where the vertex is stored
        return num_of_verticies - 1;
    }
    return -666;                  // indicate v was not added
	
}





/////////////////////////////////// deleteVertex //////////////////////////////
//
// function name      : deleteVertex
//
// purpose            : if a vertex is present in the graph, deletes it
//
// input parameters   : none
//
// output parameters  : one of type V
//
// return value       : a bool; true if added, false if not
//
///////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
bool Digraph<V, W>::deleteVertex(V& v)
{
    
	int posToDel = isVertex(v);         // get v's position to delete
    bool isDeleted = false;                    // delete indicator
    // only delete if v is in the graph
    if (posToDel != -1)
    {
        isDeleted = true;                     // update delete indicator
        graph_array.erase(graph_array.begin() + posToDel);     // First: delete v
        for (typename std::list<edge_representation<V,W>>::iterator i = graph_array[isVertex(v)].edgeList.begin(); i != graph_array[isVertex(v)].edgeList.end(); ++i)             // Second: delete all edges related with v        
        {
            if (i->name == v)           // if edge name matches v
            {
                graph_array[posToDel].edgeList.erase(i);// delete the edge
                break;                 // one v edge at most at every vertex
            }
        }
    }
    // return delete indicator
    return isDeleted;


}





/////////////////////////////////// addUniEdge ////////////////////////////////
//
// function name      : addUniEdge
//
// purpose            : adds a uni-directional edge to the graph. If both 
//						edges present,inquires if the weight should be updated 
//						or not. Returns the location/index of the vertex at the 
//						end of the edge
//
// input parameters   : none
//
// output parameters  : two of type V 
//
// return value       : int; the location of the end of the edge
//
///////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
int Digraph<V, W>::addUniEdge(V& v1, V& v2, W& w)
{
	//// Only add if the edge is not in graph:
    if (isUniEdge(v1, v2) == -666)
    {
        // Add v1 and v2 vertices into graph.
        addVertex(v1);
        addVertex(v2);
        // Add new edge <v1,v2,wt> into graph.
        edge_representation<V, W> newEdge;
        newEdge.name = v2;
        newEdge.weight = w;
        int v1Index = isVertex(v1);          // get v1 index
        graph_array[v1Index].edgeList.push_back(newEdge); // add
//        graph_array[v1Index].edgeList.sort();             // sort in ascending order                      
        return true;     // indicate the edge was added
    }
    // Else the v1->v2 edge exists:
    return false;
	

}






/////////////////////////////////// addBiDirEdge //////////////////////////////
//
// function name      : addBiDirEdge
//
// purpose            : adds a bi-directional edge to the graph
//
// input parameters   : none
//
// output parameters  : three; two of type V called v1 and v2 with one of 
//						type W called w
//
// return value       : an int; the location/index of the "end" of the edge, 
//						namely v2.
//
///////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
int Digraph<V, W>::addBiDirEdge(V& v1, V& v2, W& w)
{
	// Add edges: v1->v2 and v2->v1:
    int addE1 = addUniEdge(v1, v2, w);
    int addE2 = addUniEdge(v2, v1, w);
    // Check if edge was added successfully:
    if (addE1 == 1 && addE2 == 1)          //  (v1,v2) successfully added.
        return 1;
    else if (addE1 == -1 && addE2 == 1)    //  <v1,v2> already exists, <v2,v1> added.
        return -1;
    else if (addE1 == 1 && addE2 == -1)    //  <v1,v2> added, <v2,v1> already exists.
        return -2;
    else                                   //  (v1,v2) already exists.
        return -3;

}





/////////////////////////////////// deleteUniEdge /////////////////////////////
//
// function name      : deleteUniEdge
//
// purpose            : deletes a uni-directional edge from the graph
//
// input parameters   : none
//
// output parameters  : three; two of type V( for the edges ) and one of 
//						type W for the weight
//
// return value       : a bool; true if successful delete, otherwise false
//
///////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
bool Digraph<V, W>::deleteUniEdge(V& v1, V& v2, W& w)
{
    int index = isVertex(v1);
    int posToDel = isUniEdge(v1, v2);  // index of vertex holds v1->v2 edge
    if (posToDel != -666)  // delete if the edge is in graph
    {
        for (typename std::list<edge_representation<V,W>>::iterator i = graph_array[index].edgeList.begin(); i != graph_array[index].edgeList.end(); i++)
        {
            if (i->name == v2)
            {            // remove the edge with v2 name.
                graph_array[index].edgeList.erase(i);
                return true;
            }
        }
    }
    return false;           // else indicate no edge was deleted

}





/////////////////////////////////// deleteBiDirEdge ///////////////////////////
//
// function name      : deleteBiDirEdge
//
// purpose            : deletes a bi-directional edge grom the graph
//
// input parameters   : none
//
// output parameters  : three; two of type V( for the edges ) and one of 
//						type W for the weight
//
// return value       : a bool; true if successful delete, otherwise false
//
///////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
int Digraph<V, W>::deleteBiDirEdge(V& v1, V& v2, W& w)
{
	// Delete edges: v1->v2 and v2->v1
    int delE1 = deleteUniEdge(v1, v2, w);
    int delE2 = deleteUniEdge(v2, v1, w);
    // Check if edges were deleted successfully:
    if (delE1 == 1 && delE2 == 1)          //  (v1,v2) successfully deleted.
        return 1;
    else if (delE1 == -1 && delE2 == 1)    //  <v1,v2> doesn't exist, <v2,v1> deleted.
        return -1;
    else if (delE1 == 1 && delE2 == -1)    //  <v1,v2> deleted, <v2,v1> doesn't exist.
        return -2;
    else                                   //  (v1,v2) does not exists.
        return -3;

}





/////////////////////////////////// printDigraph //////////////////////////////
//
// function name      : printDigraph
//
// purpose            : prints the graph
//
// input parameters   : none
//
// output parameters  : none
//
// return value       : none
//
///////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
void Digraph<V, W>::printDigraph()
{


	typename std::list< edge_representation<V, W> >::iterator  it;


	for (int j = 0; j < num_of_verticies; j++)
	{
		cout << " \nfor the vertex " << graph_array[j].name << " we have the following edges : \n";

		for (it = graph_array[j].edgeList.begin(); it != graph_array[j].edgeList.end(); it++)
		{
			cout << " < " << graph_array[j].name << ", " << (*it).name << ", " << (*it).weight << " > " << endl;
		}

		cout << endl << " press enter to continue viewing the graph " << endl;
		_getche();
	}


	cout << endl << endl;
}






/////////////////////////////////// breadth ///////////////////////////////////
//
// function name      : breadth
//
// purpose            : performs a breadth first traversal of the graph starting 
//						at any user entered vertex
//
// input parameters   : one of type V
//
// output parameters  : none
//
// return value       : none
//
///////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
void Digraph<V, W>::breadth(V& start_vertex)
{
   
    //int vPos = isVertex(start_vertex);          // vector index
    //if (vPos == -1)                     // prompt user when no such vertex in graph
    //{
    //    cout << "Vertex: " << start_vertex << " is NOT in the graph";
    //    return;
    //}
    //// Prepare for BFT: 

    //std::vector<int>visited(num_of_verticies, -2);

    //std::queue<int> Q;                  // queue of vertex pointers
    //vertex<V,W> ver = graph_array[vPos];            // pointer to initial vertex
    //Q.push(vPos);                        // enqueue starting vertex

    //// Begin BFT:
    //while (!Q.empty())
    //{
    //    // Select a vertex from queue:
    //    vPos = Q.front();                 // select a vertex pointer
    //    Q.pop();                         // dequeue it from queue
    //    // Visit it if it's not visited yet:

    //        cout << " -> " << graph_array[vPos].name; // visit v
    //    
    //    // Enqueue all neighbors of current vertex:
    //    for (typename std::list<edge_representation<V, W>>::iterator i = graph_array[isVertex(start_vertex)].edgeList.begin(); i != graph_array[isVertex(start_vertex)].edgeList.end(); ++i)
    //    {
    //        int nPos = isVertex(i->name); // neighbor index in graph vector
    //        if (visited[nPos] == -2)       // if it's the unvisited neighbor
    //        {
    //            Q.push(nPos);           // enqueue the neighbor
    //            visited[nPos] = vPos;
    //        }

    //    }
    //}
	
}//end function






/////////////////////////////////// depth /////////////////////////////////////
//
// function name      : depth
//
// purpose            : performs a depth first traversal of the graph starting 
//						at any user entered vertex
//
// input parameters   : one of type V
//
// output parameters  : none
//
// return value       : none
//
///////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
void Digraph<V, W>::depth(V& start_vertex)
{
    //int vPos = isVertex(start_vertex);          // vector index
    //if (vPos == -1)                     // prompt user when no such vertex in graph
    //{
    //    cout << "Vertex: " << start_vertex << " is NOT in the graph";
    //    return;
    //}
    //// Prepare for DFT: 
    //std::vector<int>visited(num_of_verticies, -2);

    //std::stack<int> Q;                  // queue of vertex pointers
    //vertex<V, W> ver = graph_array[vPos];            // pointer to initial vertex
    //Q.push(vPos);                        // enqueue starting vertex

    //// Begin DFT:
    //while (!Q.empty())
    //{
    //    // Select a vertex from queue:
    //    vPos = Q.top();                 // select a vertex pointer
    //    Q.pop();                         // dequeue it from queue
    //    // Visit it if it's not visited yet:
    //    if (visited[vPos] != -2)       // if it's the unvisited neighbor
    //    {
    //        continue;
    //    }
    //    cout << " -> " << graph_array[vPos].name; // visit v

    //// Enqueue all neighbors of current vertex:
    //    for (typename std::list<edge_representation<V, W>>::iterator i = graph_array[isVertex(start_vertex)].edgeList.begin(); i != graph_array[isVertex(start_vertex)].edgeList.end(); ++i)
    //    {
    //        int nPos = isVertex(i->name); // neighbor index in graph vector
    //        Q.push(nPos);

    //    }
    //}
}
//end function




/////////////////////////////////// getOneVertex //////////////////////////////
//
// function name      : getOneVertex
//
// purpose            : queries user for an input vertex
//
// input parameters   : none
//
// output parameters  : one of type V, called v1
//
// return value       : none
//
///////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
void Digraph<V, W>::getOneVertex(V& v1)
{
    cout << " Please enter a vertex name  : ";
	cin >> v1;
}



/////////////////////////////////// getTwoVerticies ///////////////////////////
//
// function name      : getTwoVerticies
//
// purpose            : queries user for two input verticies
//
// input parameters   : none
//
// output parameters  : two of type V, called v1 and v2
//
// return value       : none
//
///////////////////////////////////////////////////////////////////////////////



template< typename V, typename W >
void Digraph<V, W>::getTwoVerticies(V& v1, V& v2)
{
	
	cout << " Please enter a vertex name: ";
	cin >> v1;
	cout << " Please enter the second vertex name: ";
	cin >> v2;
	
}




///////////////////////////////////////////////////////////////////////////////


#endif




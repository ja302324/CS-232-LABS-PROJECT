
/////////////////////////////////// driverFunctions.cpp ///////////////////////
//
// file name          : driverFunctions.cpp
//
// This file contains contains the implementations for auxiliary "helper" 
// functions for the driver
//
// Programmer         : B.J. STRELLER
//
// Date created       : 
//
// Date last revised  :
//
///////////////////////////////////////////////////////////////////////////////

#include "driverFunctions.h"
#include "digraph.h"


#include<iostream>

#include<fstream>
using std::ifstream;

#include<string>
using std::string;


////////////////////////////////// menuOptions ////////////////////////////////
//
// function name      : menuOptions
//
// purpose            : contains all the methods which manipulate the graph/network
//
// input parameters   : none
//
// output parameters  : none  
//
// return value       : none
//
///////////////////////////////////////////////////////////////////////////////



void menuOptions(Digraph< string, int> g, string ver1, string ver2)
{

	ifstream inFile;
	int w;													//w weight of edge
	int is;													//is means is
	bool done;												//true if sucessful

	int optionNum = 0;

	cout << "please enter one of the following menu numbers to manipulate the graph : ";

	while (optionNum != 15)									//loop for continued use
	{
		cin >> optionNum;

		switch (optionNum)
		{
		case 1:
			getInFileName(inFile);							//get file name
			g.set_size(inFile);								//count lines in file
			g.getDigraph(inFile);							//read file to a graph
			break;
		case 2:
			g.printDigraph();
			break;
		case 3:
			g.getOneVertex(ver1);
			is = g.isVertex(ver1);										//get a vertex name
			if (is >= 0)												//in graph? 
				cout << ver1 << " is a vertex in the graph \n\n";		//in graph
			else
				cout << ver1 << " is not a vertex in the graph \n\n";	//not in graph
			break;
		case 4:
			g.getTwoVerticies(ver1, ver2);
			is = g.isUniEdge(ver1, ver2);
			if (is >= 0)												//in graph?
				cout << " < " << ver1 << ", " << ver2 << " > " << " is an edge in the graph \n";
			else
				cout << " < " << ver1 << ", " << ver2 << " > " << " is not an edge in the graph \n";
			break;
		case 5:
			g.getTwoVerticies(ver1, ver2);
			is = g.isBiDirEdge(ver1, ver2);
			if (is >= 0)												//in graph? 
				cout << " < " << ver1 << ", " << ver2 << ", " << " > " << " is an edge in the graph \n";
			else
				cout << " < " << ver1 << ", " << ver2 << ", " << " > " << " is not an edge in the graph \n";
			break;
		case 6:
			g.getOneVertex(ver1);
			if (g.get_size() < g.addVertex(ver1))						//in graph?
				cout << ver1 << " has been added to the graph \n";		//add it
			else
				cout << ver1 << " is currently in the graph, so it has not been added \n";  
			break;
		case 7:
			g.getOneVertex(ver1);
			done = g.deleteVertex(ver1);								//delete vertex
			if (done)
				cout << " vertex and edges with " << ver1 << " were deleted \n";
			else
				cout << " vertex and edges with " << ver1 << " were  not deleted \n";
			break;
		case 8:
			g.getTwoVerticies(ver1, ver2);
			cout << " Please enter a weight  : ";
			cin >> w;
			is = g.addUniEdge(ver1, ver2, w);							//add one way edge
			if (is >= 0)												//v1 to v2
				cout << " < " << ver1 << ", " << ver2 << ", " << w << " > " << " has been added\n";
			else
				cout << " < " << ver1 << ", " << ver2 << ", " << w << " > " << " has not been added \n"
				<< " because this edge is already in the graph. \n"
				<< " Delete this edge if you wish a new weight\n";
			break;
		case 9:
			g.getTwoVerticies(ver1, ver2);
			cout << " Please enter a weight  : ";
			cin >> w;
			is = g.addBiDirEdge(ver1, ver2, w);							//add two way edge
			if (is >= 0)												//v1 to v2 
				cout << " < " << ver1 << ", " << ver2 << ", " << w << " > " << " has been added \n";
			else
				cout << " < " << ver1 << ", " << ver2 << ", " << w << " > " << " has not been added \n"
				<< " because this edge is already in the graph. \n"
				<< " Delete this edge if you wish a new weight\n";
			break;
		case 10:
			g.getTwoVerticies(ver1, ver2);
			done = g.deleteUniEdge(ver1, ver2, w);                      //delete 
			if (done)
				cout << " the uni-directional edge was deleted \n";
			else
				cout << " the uni-directional edge was not in the graph and not deleted \n";
			break;
		case 11:
			g.getTwoVerticies(ver1, ver2);
			done = g.deleteBiDirEdge(ver1, ver2, w);					//delete
			if (done)
				cout << " the bi-directional edge was deleted \n";
			else
				cout << " the bi-directional edge was not in the graph and not deleted \n";
			break;
		case 12:
			g.getOneVertex(ver1);
			g.breadth(ver1);											//breadth first 
			break;														//traversal
		case 13:
			g.getOneVertex(ver1);										//depth first
			g.depth(ver1);												//traversal
			break;
		case 14:
			showMenu();													//see menu again
			break;
		case 15:														//exit
			cout << " \n You are exiting the program \n ";
			break;

		}


		if (optionNum == 15)
			cout << " THANK YOU\n\n";
		else
			cout << "enter the next menu number ( press 14 to see menu options ) :  ";


	}



}




/////////////////////////////////// showMenu //////////////////////////////////
//
// function name      : showMenu
//
// purpose            : greets user and displays the menu
//
// input parameters   : none
//
// output parameters  : none  
//
// return value       : none
//
///////////////////////////////////////////////////////////////////////////////



void showMenu()
{

	cout << "     menu number               description of task \n";
	cout << "               1             RETRIVES file containing a graph \n";
	cout << "               2             DISPLAY current graph \n";
	cout << "               3             IS VERTEX in graph ?  \n";
	cout << "               4             IS UNI_DIRECTIONAL EDGE in the graph \n";
	cout << "               5             IS BI-DIRECTIONAL EDGE in graph \n";
	cout << "               6             ADD VERTEX to graph \n";
	cout << "               7             DELETE VERTEX in graph \n";
	cout << "               8             ADD UNI-DIRECTIONAL EDGE to the graph \n";
	cout << "               9             ADD BI-DIRECTIONAL EDGE to the graph \n";
	cout << "               10            DELETE UNI-DIRECTIONAL EDGE in the graph \n";
	cout << "               11            DELETE BI-DIRECTIONAL EDGE in the graph \n";
	cout << "               12            BREADTH FIRST TRAVERSAL of the graph \n";
	cout << "               13            DEPTH FIRST TRAVERSAL of the graph \n";
	cout << "               14            VIEW menu again \n";
	cout << "               15            EXIT the program \n";
	cout << endl;

}






/////////////////////////////////// greet /////////////////////////////////////
//
// function name      : greet
//
// purpose            : greets user and displays the menu
//
// input parameters   : none
//
// output parameters  : none  
//
// return value       : none
//
///////////////////////////////////////////////////////////////////////////////



void greet()
{
	cout << " \n WELCOME TO GRAPH GRATIFICATION " << endl << endl << endl;
	cout << "The options available to you for the graph are : \n\n";
}




////////////////////////////////// getInFileName //////////////////////////////
//
// function name      : getInFileName
//
// purpose            : opens the input file for reading
//
// input parameters   : none
//
// output parameters  : one; inFile  
//
// return value       : none
//
///////////////////////////////////////////////////////////////////////////////



void getInFileName(ifstream& inFile)
{

	string inFileName;

	cout << " \n Please enter the fully qualified name of the \n"
		<< " input text file, including the path: ";

	cin >> inFileName;
	cout << endl;

	inFile.open(inFileName.c_str());                                //try to open

	if (!inFile)                                                    //test if open
	{
		cerr << " cannot open file: " << inFileName << endl << endl;
		exit(-1);
	}

	inFile.clear();

}





///////////////////////////////////////////////////////////////////////////////

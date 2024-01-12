
//////////////////////////////////////////////// driver.cpp ///////////////////
//
// File name         : driver.cpp
//
// This program tests/drives all methods of the graph( or network ) adt 
// implemented in the file digraph.h. 
//
// Programmer        : B.J. Streller
//
// Date created      : 
//
// Date last revised :
//
///////////////////////////////////////////////////////////////////////////////



#include "driverFunctions.h"
#include "digraph.h"



int  main()
{
	Digraph< string, int> g;								//a graph
	string ver1, ver2;										//verticies


	greet();												//greet user
	showMenu();												//show the menu
	menuOptions(g, ver1, ver2);								//process

	return 0;
}




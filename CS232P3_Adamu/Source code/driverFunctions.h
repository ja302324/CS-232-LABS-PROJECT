
/////////////////////////////////// driverFunctions.h /////////////////////////
//
// file name          : driverFunctions.h
//
// This file contains contains the prototypes for auxiliary "helper" functions 
// for the driver
//
// Programmer         : B.J. STRELLER
//
// Date created       : 
//
// Date last revised  :
//
///////////////////////////////////////////////////////////////////////////////


#ifndef _DRIVERFUNCTIONS_H
#define _DRIVERFUNCTIONS_H

#include "digraph.h"

#include<fstream>
using std::ifstream;



void  greet();
void  showMenu();
void  menuOptions(Digraph< string, int> g, string ver1, string ver2); //process the selection
void  getInFileName(ifstream& inFile);


#endif

/*
  File name: map.cpp
 
 This file contains the implementation of mappingOfData function.
 
  Programmer: Jesse Admau
  Date Written: 02/15/2023
  Date Last Revised: 03/01/2023
*/

#include "map.h"

/*******************************************************************************************
 * Function Name: mapData
 *
 * Purpose: Function to map a given table entry into one-dimensional array index.
 *          array index = n * i + j
 *          n is total columns of the table
 *          i is current element's row
 *          j is current element's col
 *
 * Input Parameters:
 *          pair: a key-value pair from pair.h
 *
 * Output parameters: none.
 *
 * Return Value:
 *          index of an array for the specified element within the table.
 ********************************************************************************************/
int mapData(Pair<stateT, eventT > pair)
{
    return 5 * pair.first + pair.second;
}
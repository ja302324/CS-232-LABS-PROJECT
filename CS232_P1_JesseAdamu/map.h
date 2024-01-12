/**************************************************************************
 * File name: mapping.h
 * --------------------
 * This file does two things:
 *   Frist: contains the mapping function for the Table class.
 * 
 *   Second: exports types of key-value pair for the Table class:
 *       three enumerated types: stateT, eventT, actionT;
 *       one const int type: tableSize.
 *
 * Programmer: Jesse Adamu
 * Date Written: 02/15/2023
 * Date Last Revised: 03/01/2023
**************************************************************************/

#ifndef MAP_H
#define MAP_H

#include "table.h"

/* Total size of the table */
const int tableSize = 35;

/*
 * Type: stateT
 * ---------------
 * This enumerated type is used to represent the 7 lock states
 */
enum stateT {
    nke = 0,
    ok1 = 1,
    ok2 = 2,
    ok3 = 3,
    fa1 = 4,
    fa2 = 5,
    fa3 = 6
};

/*
 * Type: eventT
 * ---------------
 * This enumerated type is used to represent the 5 user actions
 */
enum eventT {
    A = 0, B = 1, C = 2, D = 3, E = 4
};

/*
 * Type: actionT
 * ---------------
 * This enumerated type is used to represent 2 lock actions
 */
enum actionT {
    alarm = 1,
    unlock = 2
};

/* Index function for Table class */
int mapData(Pair<stateT, eventT > pair);

#endif //MAP_H
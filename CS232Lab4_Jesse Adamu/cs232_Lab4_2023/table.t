/**************************************************************************
 * File name: table.t
 * ------------------
 * This file implements all templated functions of the table.h interface.
 *
 * Programmer: Jesse Adamu
 * Date Written: 02/08/2023
 * Date Last Revised: 02/14/2023
 **************************************************************************/

#ifndef TABLE_T
#define TABLE_T

#include <iostream>
#include <cstdio>

/*******************************************************************************************
 * Constructor: Table
 * ------------------
 * Purpose: The constructor of the Table class.
 *          Initialize the Mapping function from map function.
 *          Initialize table capacity from n, and initialize tableSize to 0.
 *          Initialize the one-dimensional array with default value for table.
 *
 * Input Parameters:
 *          n: the capacity of the table array.
 *          map: mapping function from table entry into an one-dimension array index
 *
 * Output parameters: none.
 *
 * Return Value: none.
 *******************************************************************************************/
template <class Key, typename T>
Table<Key, T>::Table(int n,  int (*map)(Key k) )
        : tableCapacity(n), tableSize(0), Mapping(map)
{
    the_table = new Pair<Key, T> [tableCapacity]; // allocate a dynamic array of n size.

    // initialize each pair's T value with default values.
    for (int i = 0; i < tableCapacity; i++)
        the_table[i].second = (T)0;
}

/*******************************************************************************************
 * Function Name: ~Table
 * ---------------------
 * Purpose: The destructor of the Table class, handle memory leaks.
 *
 * Input Parameters:  none.
 *
 * Output parameters: none.
 *
 * Return Value: none.
 ********************************************************************************************/
template <class Key, typename T>
Table<Key, T>::~Table()
{
    delete [] the_table;
}

/*******************************************************************************************
 * Function Name: Table
 * --------------------
 * Purpose: The copy constructor of the Table class, perform deep copy when initializing object.
 *
 * Input Parameters:  none.
 *
 * Output parameters: none.
 *
 * Return Value: none.
 ********************************************************************************************/
template <class Key, typename T>
Table<Key, T>::Table(const Table& initTable)
{
    deepCopy(initTable);
}


/*******************************************************************************************
 * Function Name: operator =
 * -------------------------
 * Purpose: overload assignment operator.
 *
 * Input Parameters:
 *          initTable: Table object that needs to be copied on the right hand side of =.
 *
 * Output parameters: none.
 *
 * Return Value:
 *          a Table type object that is the same as initTable.
 ********************************************************************************************/
template <class Key, typename T>
Table<Key, T>& Table<Key, T>::operator = (const Table& initTable)
{
    if (this != &initTable) {
        delete [] the_table;   // clean the left table
        deepCopy(initTable);   // copy from right to the left
    }
    return *this;
}

/*******************************************************************************************
 * Function Name: insert
 * ---------------------
 * Purpose: insert an item with an associated key.

 *
 * Input Parameters:
 *         kpair: a key-value pair to be added.
 *
 * Output parameters: none.
 *
 * Return Value:
 *          return true if if pair was added successfully.
 *          return false if the pair was not added.
 ********************************************************************************************/
template <class Key, typename T>
bool Table<Key, T>::insert(Pair<Key, T> kpair)
{
    int index = Mapping(kpair.first); // get array index by key

    if (the_table[index] == kpair)    // if table element already exists
        return false;                  // indicating item was NOT added

    // Now insert key-value pair since item not exists
    tableSize++;
    the_table[index] = kpair;   // assign the new data
    return true;                 // indicating item was added
}

/*******************************************************************************************
 * Function Name: remove
 * ---------------------
 * Purpose: remove the item associated with the specified key.
 *
 * Input Parameters:
 *         aKey: the specified key to be removed.
 *
 * Output parameters: none.
 *
 * Return Value:
 *          Return true if removed successfully, and the key value is reset.
 *          Return false if no need to remove, since item is already default value(empty).
 ********************************************************************************************/
template <class Key, typename T>
bool Table<Key, T>::remove(const Key aKey)
{
    int index = Mapping(aKey);   // get array index by key

    if ( the_table[index].second != (T)0 )  // if item exists
    {
        the_table[index].second = (T)0;  // remove: item is replaced with default 0.
        tableSize--;
        return true; // indicating successful removal
    }

    return false;    // indicating no removal
}

/*******************************************************************************************
 * Function Name: lookUp
 * ---------------------
 * Purpose: find and return the item associated with the specified key.
 *
 * Input Parameters:
 *          aKey: the specified key to be looked up.
 *
 * Output parameters: none.
 *
 * Return Value:
 *          Return item value of type T.
 ********************************************************************************************/
template <class Key, typename T>
T Table<Key, T>::lookUp(const Key aKey)
{
    int index = Mapping(aKey);      // get array index by key
    return the_table[index].second; // return the corresponding value of the key. 
}
template <class Key, typename T>
void Table<Key, T>::print()
{
    for(int i = 0; i < tableCapacity; i++)
    {
        std::cout << the_table[i].first<< "   ";
        std::cout << the_table[i].second << std::endl;
    }
}

#endif

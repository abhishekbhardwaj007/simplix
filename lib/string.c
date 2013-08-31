//
// Contains function for string manipulation
//

#include <stddef.h>
#include <stdint.h>
#include "string.h"


//
//
// Params :
// 	dest : Destination where string is desired
//  src  : Source from which string is copied
//
// Return :
//	Pointer to destination string.
//
// Description :
// Copies source into destination including null. Destination should be big
// enough and memory areas shouldn't be overlapping. In case of overlap 
// behavior is undefined
//
char* strcpy(char* dest, const char* src)
{  
    const char* i = NULL;

    if ((dest == NULL) || (src == NULL))
    {
        return dest;
    }

    i = src;
    while (*i)
    {
        *dest = *i;
        dest++;
        i++;
    }

    *dest = '\0';

    return dest;
}

//
//
// Params :
// 	dest : Destination where string is desired
//  src  : Source from which string is copied
//  n    : Number of characters to be copied
//
// Return :
//	Pointer to destination string.
//
// Description :
// Copies source into destination including null. Destination should be big
// enough and memory areas shouldn't be overlapping. In case of overlap 
// behavior is undefined
//
char* strncpy(char* dest, const char* src, size_t n)
{  
    const char* i = NULL;
    size_t count = 0;

    if ((dest == NULL) || (src == NULL))
    {
        return dest;
    }

    i = src;
    while (count < n)
    {
        *dest = *i;
        dest++;
        i++;
        count++;
    }

    return dest;
}


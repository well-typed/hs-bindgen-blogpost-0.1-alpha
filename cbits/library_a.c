#include "library_a.h"

#include <stdio.h>

void showVersion(struct Version v) {
    printf("%d.%d\n", v.major, v.minor);
}

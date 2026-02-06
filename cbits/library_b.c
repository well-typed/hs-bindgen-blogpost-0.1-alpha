#include "library_b.h"

#include <stdio.h>
#include <stdlib.h>

int trivialRun(struct Driver* self) {
    return 1;
};

void initDriver(struct Driver *d) {
    d->name          = "unnamed driver";
    d->version.major = 1;
    d->version.minor = 1;
    d->run           = trivialRun;
}

void showDriver(struct Driver* d) {
    printf("%s version %d.%d\n", d->name, d->version.major, d->version.minor);
}

int callDriver(struct Driver* d) {
    return d->run(d);
}

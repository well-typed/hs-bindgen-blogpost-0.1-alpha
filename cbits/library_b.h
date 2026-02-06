#pragma once

#include "library_a.h"

struct Driver;
typedef int RunDriver(struct Driver* self);

struct Driver {
  char* name;
  struct Version version;
  RunDriver* run;
};

void initDriver(struct Driver *d);
void showDriver(struct Driver *d);
int callDriver(struct Driver* d);

typedef struct Driver DeviceDriver;

#define SIGNALID 0x01
#define INPUT_PORT(x) x + 4
#define S16_TYPE short int




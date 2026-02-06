#pragma once

struct Version {
  int major;
  int minor;
};

void showVersion(struct Version v);

typedef struct Point {
  int x;
  int y;
} Point;
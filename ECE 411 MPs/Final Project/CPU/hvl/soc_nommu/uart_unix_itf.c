#include <stdio.h>
#include <sys/ioctl.h>
#include <svdpi.h>

int is_char_available() {
  int chars_in_stream;
  ioctl(0, FIONREAD, &chars_in_stream);
  return chars_in_stream != 0;
}

int get_one_char() {
  int retval = 0;
  read(fileno(stdin), &retval, 1);
  return retval;
}

void write_one_char(const char c) {
  printf("%c", c);
  fflush(stdout);
}

/*
 * tab:2
 *
 * mystery.c
 *
 * Permission to use, copy, modify, and distribute this software and its
 * documentation for any purpose, without fee, and without written agreement is
 * hereby granted, provided that the above copyright notice and the following
 * two paragraphs appear in all copies of this software.
 *
 * IN NO EVENT SHALL THE AUTHOR OR THE UNIVERSITY OF ILLINOIS BE LIABLE TO
 * ANY PARTY FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL
 * DAMAGES ARISING OUT  OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION,
 * EVEN IF THE AUTHOR AND/OR THE UNIVERSITY OF ILLINOIS HAS BEEN ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * THE AUTHOR AND THE UNIVERSITY OF ILLINOIS SPECIFICALLY DISCLAIM ANY
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE SOFTWARE
 * PROVIDED HEREUNDER IS ON AN "AS IS" BASIS, AND NEITHER THE AUTHOR NOR
 * THE UNIVERSITY OF ILLINOIS HAS ANY OBLIGATION TO PROVIDE MAINTENANCE,
 * SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS."
 *
 * Author:        Yan Miao
 * Version:       1
 * Creation Date: Sun Aug 29 2021
 * Author:        Xiang Li
 * Version:       2
 * Modified Date: Sun Aug 21 2022
 * History:
 *    YM    1    Sun Aug 29 2021
 *    XL    2    Sun Aug 21 2022
 */

#include "mystery.h"

uint32_t mystery_c(uint32_t x, uint32_t y) {
  // base conditions
  if (y > 24) return 0;
  if (x >= 42) return 0;

  // add from 0 to x
  int32_t j = 0;
  for (int32_t i = 1; i <= (int32_t) x ; i++) {j += i;}
  
  // multiply from 1 to y
  int32_t k = 1;
  for (int32_t i = 1; i <= (int32_t) y; i++) {k *= i;}

  //return bitwise or of k and j
  return k|=j;
}

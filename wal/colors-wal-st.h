const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0F0915", /* black   */
  [1] = "#B36431", /* red     */
  [2] = "#D1AE4D", /* green   */
  [3] = "#D8B44A", /* yellow  */
  [4] = "#1A1683", /* blue    */
  [5] = "#211A80", /* magenta */
  [6] = "#615191", /* cyan    */
  [7] = "#c7b0c0", /* white   */

  /* 8 bright colors */
  [8]  = "#8b7b86",  /* black   */
  [9]  = "#B36431",  /* red     */
  [10] = "#D1AE4D", /* green   */
  [11] = "#D8B44A", /* yellow  */
  [12] = "#1A1683", /* blue    */
  [13] = "#211A80", /* magenta */
  [14] = "#615191", /* cyan    */
  [15] = "#c7b0c0", /* white   */

  /* special colors */
  [256] = "#0F0915", /* background */
  [257] = "#c7b0c0", /* foreground */
  [258] = "#c7b0c0",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;

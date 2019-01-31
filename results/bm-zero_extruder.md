## Results of Zero Extruder Test

|                |   Rate | comp_regex    | index  | substr | non-greedy  | greedy   | naive   | exact |
|:-------------- | ------:| -------------:| ------:| ------:| -----------:| --------:| -------:| -----:|
| **comp_regex** | 14.1/s |         --    |  -61%  |   -68% |       -77%  |   -77%   |  -78%   |  -85% |
| **index**      | 36.2/s |       158%    |    --  |   -17% |       -40%  |   -41%   |  -42%   |  -61% |
| **substr**     | 43.7/s |       210%    |   21%  |     -- |       -28%  |   -29%   |  -31%   |  -53% |
| **non-greedy** | 60.2/s |       328%    |   66%  |    38% |         --  |    -2%   |   -4%   |  -35% |
| **greedy**     | 61.3/s |       336%    |   69%  |    40% |         2%  |     --   |   -2%   |  -34% |
| **naive**      | 62.9/s |       347%    |   74%  |    44% |         4%  |     3%   |    --   |  -32% |
| **exact**      | 92.6/s |       558%    |  156%  |   112% |        54%  |    51%   |   47%   |    -- |

### Tests

   * naive - obvious, naive regular expression approach
   * greedy - careful, greedy regular expression to match
   * non-greedy - careful, non-greedy regular expression to match
   * comp\_regex - compiled regular expression
   * substr - break string apart with `substr()` and do compares
   * index - combination of `index()` and `substr()` with compares
   * exact - exact string compare

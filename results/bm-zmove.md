## Results of Z Move Test

|                |   Rate | comp_regex | sub_greedy | substr   | index   | naive | greedy | non-greedy |
|:-------------- | ------:| ----------:| ----------:| --------:| -------:| -----:| ------:| ----------:|
| **comp_regex** | 16.9/s |         -- |        -4% |    -4%   |   -5%   |  -70% |   -71% |       -71% |
| **sub_greedy** | 17.6/s |         4% |         -- |    -1%   |   -1%   |  -69% |   -70% |       -70% |
| **substr**     | 17.7/s |         4% |         1% |     --   |   -1%   |  -69% |   -69% |       -70% |
| **index**      | 17.8/s |         5% |         1% |     1%   |    --   |  -69% |   -69% |       -70% |
| **naive**      | 56.5/s |       233% |       221% |   220%   |  218%   |    -- |    -2% |        -3% |
| **greedy**     | 57.8/s |       241% |       229% |   227%   |  225%   |    2% |     -- |        -1% |
| **non-greedy** | 58.5/s |       245% |       233% |   231%   |  229%   |    4% |     1% |         -- |


### Tests

   * naive - obvious, naive regular expression approach
   * greedy - careful, greedy regular expression to match
   * non-greedy - careful, non-greedy regular expression to match
   * comp\_regex - compiled regular expression
   * sub\_greedy - greedy regular expression in a closure
   * substr - break string apart with `substr()` and do compares
   * index - combination of `index()` and `substr()` with compares

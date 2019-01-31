## Results of Double Z Move test

|                 |   Rate | naive | comp_regex | substr | index | comp_staged | staged | sub_greedy | scoped | non-greedy | greedy |
|:--------------- | ------:| -----:| ----------:| ------:| -----:| -----------:| ------:| ----------:| ------:| ----------:| ------:|
| **naive**       | 84.0/s |    -- |        -3% |    -4% |   -5% |         -7% |    -8% |       -13% |   -13% |       -14% |   -18% |
| **comp_regex**  | 87.0/s |    3% |         -- |    -1% |   -2% |         -3% |    -5% |       -10% |   -10% |       -11% |   -16% |
| **substr**      | 87.7/s |    4% |         1% |     -- |   -1% |         -3% |    -4% |        -9% |    -9% |       -11% |   -15% |
| **index**       | 88.5/s |    5% |         2% |     1% |    -- |         -2% |    -4% |        -8% |    -8% |       -10% |   -14% |
| **comp_staged** | 90.1/s |    7% |         4% |     3% |    2% |          -- |    -2% |        -6% |    -6% |        -8% |   -13% |
| **staged**      | 91.7/s |    9% |         6% |     5% |    4% |          2% |     -- |        -5% |    -5% |        -6% |   -11% |
| **sub_greedy**  | 96.2/s |   14% |        11% |    10% |    9% |          7% |     5% |         -- |    -0% |        -2% |    -7% |
| **scoped**      | 96.2/s |   14% |        11% |    10% |    9% |          7% |     5% |         0% |     -- |        -2% |    -7% |
| **non-greedy**  | 98.0/s |   17% |        13% |    12% |   11% |          9% |     7% |         2% |     2% |         -- |    -5% |
| **greedy**      |  103/s |   23% |        19% |    18% |   16% |         14% |    12% |         7% |     7% |         5% |     -- |

### Tests

   * naive - obvious, naive regular expression approach
   * greedy - careful, greedy regular expression to match
   * non-greedy - careful, non-greedy regular expression to match
   * comp\_regex - compiled regular expression
   * sub\_greedy - greedy regular expression in a closure
   * substr - break string apart with `substr()` and do compares
   * index - combination of `index()` and `substr()` with compares
   * staged - simple state machine and regular expressions
   * comp\_staged - compiled regular expressions and simple state machine
   * scoped - I've heard some people suggest that a Perl scope can generate a performance penalty. Quick test.

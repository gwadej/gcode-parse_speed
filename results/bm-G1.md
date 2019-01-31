## Results of G1 Test

|                |   Rate | two regex | comp_regex | sub_greedy | substr | index | argstr | args | scoped | naive | non-greedy | greedy | greedy tr |
|:-------------- | ------:| ---------:| -----------:| -----------:| ------:| -----:| ------:| ----:| ------:| -----:| ----------:| ------:| ---------:|
| **two regex**  | 14.0/s |        -- |       -12%  |       -17%  |   -24% |  -28% |   -42% | -43% |   -72% |  -72% |       -73% |   -73% |      -75% |
| **comp_regex** | 16.0/s |       14% |         --  |        -6%  |   -14% |  -18% |   -34% | -35% |   -68% |  -68% |       -69% |   -69% |      -71% |
| **sub_greedy** | 17.0/s |       21% |         6%  |         --  |    -9% |  -13% |   -30% | -31% |   -66% |  -66% |       -67% |   -67% |      -69% |
| **substr**     | 18.6/s |       32% |        16%  |         9%  |     -- |   -5% |   -23% | -24% |   -63% |  -63% |       -64% |   -64% |      -67% |
| **index**      | 19.5/s |       39% |        22%  |        15%  |     5% |    -- |   -20% | -21% |   -61% |  -61% |       -62% |   -63% |      -65% |
| **argstr**     | 24.3/s |       73% |        51%  |        43%  |    31% |   25% |     -- |  -1% |   -52% |  -52% |       -53% |   -53% |      -56% |
| **args**       | 24.6/s |       75% |        53%  |        44%  |    32% |   26% |     1% |   -- |   -51% |  -51% |       -52% |   -53% |      -56% |
| **scoped**     | 50.3/s |      258% |       214%  |       195%  |   170% |  158% |   107% | 105% |     -- |   -1% |        -3% |    -4% |      -10% |
| **naive**      | 50.5/s |      260% |       215%  |       197%  |   172% |  159% |   108% | 106% |     1% |    -- |        -2% |    -3% |       -9% |
| **non-greedy** | 51.5/s |      267% |       222%  |       203%  |   177% |  164% |   112% | 110% |     3% |    2% |         -- |    -1% |       -7% |
| **greedy**     | 52.1/s |      271% |       225%  |       206%  |   180% |  167% |   115% | 112% |     4% |    3% |         1% |     -- |       -6% |
| **greedy tr**  | 55.6/s |      296% |       247%  |       227%  |   199% |  185% |   129% | 126% |    11% |   10% |         8% |     7% |        -- |

### Tests

   * naive - obvious, naive regular expression approach
   * greedy - careful, greedy regular expression to match
   * non-greedy - careful, non-greedy regular expression to match
   * comp\_regex - compiled regular expression
   * sub\_greedy - greedy regular expression in a closure
   * substr - break string apart with `substr()` and do compares
   * index - combination of `index()` and `substr()` with compares
   * scoped - I've heard some people suggest that a Perl scope can generate a performance penalty. Quick test.
   * argstr - capture args and string compare
   * args - capture args and numeric compare
   * greedy tr - the greedy test from above with a `tr///` check to fail fast on mismatch

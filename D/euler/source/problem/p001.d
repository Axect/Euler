module problem.p001;

import dnum.tensor;
import dnum.stats;

int p001() {
  auto a = Tensor(Range(1,999));
  return  cast(int)(a.fmap(x => (x%3 == 0 || x%5 == 0) ? x : 0)).sum;
}

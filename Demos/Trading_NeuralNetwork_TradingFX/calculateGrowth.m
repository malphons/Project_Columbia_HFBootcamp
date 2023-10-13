function Growth = calculateGrowth(positions,FutureReturns)

actualReturns = positions .* FutureReturns;
Growth  = cumprod([100; 1+actualReturns]);

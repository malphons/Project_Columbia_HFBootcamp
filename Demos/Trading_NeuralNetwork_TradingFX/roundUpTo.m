function out = roundUpTo(num , roundTo)

out = ceil(num ./ roundTo) .* roundTo;

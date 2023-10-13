function out = roundTo(num , roundTo)

out = round(num ./ roundTo) .* roundTo;

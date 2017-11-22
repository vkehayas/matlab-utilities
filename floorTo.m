function floored = floorTo(value, precision)

magnitude = 10^precision;

floored = floor(magnitude * value) / magnitude;

end
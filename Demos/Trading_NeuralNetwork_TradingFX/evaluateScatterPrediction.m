function evaluateScatterPrediction(ActualReturn,PredictedReturn)

figure
plot(ActualReturn,PredictedReturn,'ro')
xlabel('Actual Return')
ylabel('Predicted Return')
title('Comparison between Actual vs. Predicted returns')
grid on
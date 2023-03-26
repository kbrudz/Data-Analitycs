data {
    int N;
}

generated quantities {
   int y;
   real<lower=0, upper=1> theta;
   theta = normal_rng(0.2, 0.02);
   y = binomial_rng(N, theta);
}

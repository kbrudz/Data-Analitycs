data {
  int<lower=0> N;              // number of samples
  real heights[N];             // array of heights
}
parameters {
  real<lower=0> mu;            // mean of the normal distribution
  real<lower=0> sigma;         // standard deviation of the normal distribution
}
model {
  // priors
  mu ~ normal(170, 20);
  sigma ~ normal(10, 5);

  // likelihood
  heights ~ normal(mu, sigma);
}
generated quantities {
  real height = normal_rng(mu, sigma);
}
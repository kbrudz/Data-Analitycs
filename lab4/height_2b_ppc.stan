data{
  int<lower=0> N;
  real weight[N];
}

generated quantities {
  real alfa_2=normal_rng(175,20);
  real beta_2=lognormal_rng(0,1);
  real<lower=0> sigma=exponential_rng(0.067);
  real height[N];

  for (i in 1:N){
    height[i] = normal_rng(alfa_2 + beta_2*weight[i], sigma);
    
  }
}
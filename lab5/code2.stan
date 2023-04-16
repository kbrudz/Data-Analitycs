data {
    int<lower=0> N;  // number of samples
    real miles[N];  // samples
    int accidents[N];
}

parameters {
   real alfa;
   real theta;
}

transformed parameters {
   real lambda[N];
   for (i in 1:N) {
       lambda[i] = exp(alfa + theta * miles[i]);
    }
}

model {
   alfa ~ normal(1.9, 0.001);
   theta ~ normal(0.0001, 0.00008);
   accidents ~ poisson(lambda);
}

generated quantities {
    array[N] int<lower=0> accidents_number;
    for (i in 1:N) {
       accidents_number[i] = poisson_rng(lambda[i]);
    }
}
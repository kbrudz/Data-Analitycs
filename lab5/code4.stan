data {
    int<lower=0> N;  // number of samples
    real miles[N];  // samples
    int accidents[N];
}

parameters {
   array[N] real alfa;
   real theta;
}

transformed parameters {
   array[N] real lambda;
   for (i in 1:N) {
       lambda[i] = exp(alfa[i] + theta * miles[i]);
    }
}

model {
   alfa ~ normal(2.5, 0.001);
   theta ~ normal(0.0001, 0.00005);
   accidents ~ poisson(lambda);
}

generated quantities {
    array[N] int<lower=0> accidents_number;
    for (i in 1:N) {
       accidents_number[i] = poisson_rng(lambda[i]);
    }
}
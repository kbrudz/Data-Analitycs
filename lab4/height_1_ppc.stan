generated quantities {
    real<lower=0> mu;
    real sigma;
    real<lower=0> height;

    mu = normal_rng(180, 10);  
    sigma = normal_rng(15, 2);  
    height = normal_rng(mu, sigma);
}
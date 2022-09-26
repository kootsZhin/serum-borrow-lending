cargo run \
  update-reserve \
  --reserve BZtonm8EYePKfVGY1u4ztg32uYPEtysrUZvocaq1CMBF \
  --market-owner owner.json \
  --market 5LHe64h39ZuBnBfYBqLTbRwjNevJYqP33By81onYbFuT \
  --pyth-product ALP8SdU9oARYVLgLR7LrqMNCYBnhtnQz1cj6bwgwQmgj \
  --pyth-price H6ARHf6YXhGYeQfUzQNGk6rDNnLBQKrenN712K4AQJEG \
  --optimal-utilization-rate 90 \
  --loan-to-value-ratio 90 \
  --liquidation-bonus 3 \
  --liquidation-threshold 95 \
  --min-borrow-rate 0 \
  --optimal-borrow-rate 10 \
  --max-borrow-rate 150 \
  --borrow-fee 0.1 \
  --flash-loan-fee 0.3 \
  --host-fee-percentage 20 \
  --verbose
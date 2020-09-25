# Distribution

A distribution of a data set is an expression of all the possible values and the
frequency of the data.

Wait... How can you express the frequency of numerical data sets? You categorize
them as you see fit! E.G.

You're describing a set of 1492 numbers between 0-100. You could categorize them
into buckets/categories of 10, then plot a histogram to express the
distribution.

## Gaussian/Normal Distribution

So common it's called the normal distribution!

That nice perfect bell curve on a histogram.

The normal distribution is a even distribution around a central value i.e. the
median and the mean are very close together. To rephrase that there is
distribution symmetry around the mean.

Real world examples: human height, error measurements, blood pressures.

          =
         ===
        =====
      =========    <--- oh histogram representing a normal distribution
      
## Percentiles

### What are they?

Lets use HTTP response times because, that's where I'll often use this stuff.

- 95th Percentile = 95% of all requests are within that range (say: 0-200ms).

They're that simple. X% of the population is within the range quoted.

### When to use them?

Percentiles aren't arsed about outliers, they can account for wierd
distributions much more accurately. 

Use them with data that isn't distributed normally.

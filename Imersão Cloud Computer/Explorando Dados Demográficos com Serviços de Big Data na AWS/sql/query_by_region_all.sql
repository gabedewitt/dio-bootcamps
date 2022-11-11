select region,
	sum(population)
from "populationdb"."population"
group by region;

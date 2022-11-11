select region,
	sum(population)
from "populationdb"."population"
where region='Norte'
group by region;

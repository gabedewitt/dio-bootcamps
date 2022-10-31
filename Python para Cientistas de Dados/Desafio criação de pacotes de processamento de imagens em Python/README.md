# earth-distances-package

Description. 
The package earth_distances is used to:

	Distance:
		- Calculate and returns distances between two points on the surface of
		the Earth, or another sphere, provided its radius, rounded to thte
	Map_Plotting:	
		- Plot the points on a map of our planet, alongside the distance line
		in a desired color

## Installation

Use the package manager [pip](https://pip.pypa.io/en/stable/) to install earth_distances

```bash
pip install earth_distances
```

## Usage

```python
from earth_distances.distance_calculation import harvesini
# Calculating the distance between Paris and Beijing
harvesini.harvesini_distance(48.856613, 2.352222, 39.904202, 116.407394)
>>>8216984.310
```

```python
from earth_distances.map_plotting import world_map_plot
# Plotting the map related to Paris and Beijing 
world_map_plot.plot_world_map(48.856613, 2.352222, 39.904202, 116.407394)
```
![Example](/Screenshot_1.png)
## Author
Gabriel Vinicius Sebastião

## License
[MIT](https://choosealicense.com/licenses/mit/)
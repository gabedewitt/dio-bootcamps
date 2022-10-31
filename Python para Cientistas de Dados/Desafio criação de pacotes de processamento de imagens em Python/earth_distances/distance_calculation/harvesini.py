from math import pi, sin, cos, asin, sqrt

def harvesini_distance(lat_origin, lon_origin, lat_final, lon_final, sphere_radius: int = 6371000)-> float:
    """Function that uses the harvesini's formula
    to calculate the distance between two points,
    on the surface of a sphere, said function has
    the radius of the sphere set by default as the
    radius of the Earth, but by inputting a given
    radius it can also apply the formula to any sphere.

    Args:
        lat_origin (float): latitude of the origin point
        lon_origin (float): longitude of the origin point
        lat_final (float): latitude of the end point
        lon_final (float): longitude of the end point
        sphere_radius (int, optional): variable of the radius of the sphere, 
        by default it is 6371000 meters.

    Returns:
        float: distance in meters between the two points
    """
    distance_lat = (lat_final - lat_origin) * pi / 180.0
    distance_lon = (lon_final - lon_origin) * pi / 180.0

    lat_origin = lat_origin * pi / 180.0
    lat_final = lat_final * pi / 180.0

    result = sin(distance_lat / 2)**2 + sin(distance_lon / 2)**2* cos(lat_origin) * cos(lat_final)
    angle = 2 * asin(sqrt(result))
    return round(sphere_radius * angle, 3)
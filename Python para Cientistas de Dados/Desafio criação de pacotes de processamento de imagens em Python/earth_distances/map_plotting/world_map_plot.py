import plotly.graph_objects as go
import numpy as np
from matplotlib.colors import is_color_like


def plot_world_map(lat_origin, lon_origin, lat_final, lon_final, user_color: str = 'red') -> None:
    """Function that receives the coordinates of two points and
    makes a plotly plot with both and the line that they trace,
    in red, by default, or a color defined by the user. 

    Args:
        lat_origin (float): latitude of the origin point
        lon_origin (float): longitude of the origin point
        lat_final (float): latitude of the end point
        lon_final (float): longitude of the end point
    """
    if is_color_like(user_color) == False:
        print("You've entered something that's not a color. Please try again")
        return 

    latitudes = [lat_origin, lat_final]
    longitudes = [lon_origin, lon_final]
    fig = go.Figure(go.Scattermapbox(
        mode = "markers+lines",
        lat = latitudes,
        lon = longitudes,
        marker = {'size': 10}))
     
    fig.update_layout(
        margin ={'l':0,'t':0,'b':0,'r':0},
        mapbox = {
            'center': {'lon': np.mean(longitudes), 
                       'lat': np.mean(latitudes)},
            'style': "stamen-terrain",
            'zoom': 3})

    fig.update_traces(line_color=user_color , marker_color=user_color)

    fig.show()

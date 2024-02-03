import requests
import json

def get_location():
    url = "https://ipinfo.io"
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an HTTPError for bad responses (4xx and 5xx)
        data = response.json()
        location = data["loc"]
        location = location.split(',')
        return location
    except requests.exceptions.RequestException as e:
        print(f"Error: {e}")

def get_weather_data(api_key):
    location = get_location()
    url = "https://api.openweathermap.org/data/3.0/onecall"
    params = {
        "lat": float(location[0]),
        "lon": float(location[1]),
        "units": "metric",
        "appid": api_key
    }

    try:
        response = requests.get(url, params=params)
        response.raise_for_status()  # Raise an HTTPError for bad responses (4xx and 5xx)

        # Print the JSON response
        print(json.dumps(response.json(), indent=2))

    except requests.exceptions.RequestException as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    api_key = "API_KEY"
    get_weather_data(api_key)


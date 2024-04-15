import requests
import json

from pathlib import Path

def get_location():
    data_keys = ["ip", "city", "region", "country", "loc"]
    file_path = Path.home() / ".yasb" / "weather.json"
    file = open(file_path)
    json_data = json.load(file)
    
    return {key: json_data[key] for key in data_keys}

def get_weather_data(api_key):
    location = get_location()
    url = "https://api.openweathermap.org/data/3.0/onecall"
    params = {
        "lat": float(location["loc"][0]),
        "lon": float(location["loc"][1]),
        "units": "metric",
        "appid": api_key
    }

    try:
        response = requests.get(url, params=params)
        response.raise_for_status()  # Raise an HTTPError for bad responses (4xx and 5xx)
        response_json = response.json()
        
        response_json |= location

        # Save it in a JSON file
        file_path = Path.home() / ".yasb" / "weather.json"
        with open(file_path, "w") as f:
            json.dump(response_json, f, indent=2)

        # Print the JSON response
        print(json.dumps(response_json, indent=2))

    except requests.exceptions.RequestException as e:
        print(f"Error fetching weather: {e}")

if __name__ == "__main__":
    api_key = "API_KEY"
    get_weather_data(api_key)

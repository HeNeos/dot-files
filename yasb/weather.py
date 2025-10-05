import requests
import json

from pathlib import Path

weather_json_path = Path.home() / ".config" / ".yasb" / "weather.json"


def get_location() -> dict:
    data_keys = ["ip", "city", "region", "country", "loc"]
    file = open(weather_json_path)
    json_data = json.load(file)

    return {key: json_data[key] for key in data_keys}


def get_weather_data(api_key: str) -> None:
    location = get_location()
    url = "https://api.openweathermap.org/data/3.0/onecall"
    params = {
        "lat": float(location["loc"][0]),
        "lon": float(location["loc"][1]),
        "units": "metric",
        "appid": api_key,
    }

    try:
        response = requests.get(url, params=params)
        match response.status_code:
            case 200:
                response_json = response.json()
                response_json |= location
            case _:
                with open(weather_json_path, "r") as f:
                    response_json = json.load(f)
    except Exception:
        with open(weather_json_path, "r") as f:
            response_json = json.load(f)
        # print(f"Error fetching weather: {e}, using old cache")

    with open(weather_json_path, "w") as f:
        json.dump(response_json, f, indent=2)

    print(json.dumps(response_json, indent=2))


if __name__ == "__main__":
    api_key = "6e34c8cbd8713a6a9528e9ff880c75eb"
    get_weather_data(api_key)

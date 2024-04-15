import requests
import json

from pathlib import Path

def get_location():
    data_keys = ["ip", "city", "region", "country", "loc"]
    url = "https://ipinfo.io"
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an HTTPError for bad responses (4xx and 5xx)
        data = response.json()
        ip_json = {key: data[key] for key in data_keys}
        ip_json["loc"] = data["loc"].split(",")
    except requests.exceptions.RequestException as e:
        print(f"Error fetching ip: {e}")
        ip_json = dict()
    file_path = Path.home() / ".yasb" / "weather.json"
    file = open(file_path)
    json_data = json.load(file)
    json_data |= ip_json

    # Save it in a JSON file
    with open(file_path, "w") as f:
        json.dump(json_data, f, indent=2)

    return {key: json_data[key] for key in data_keys}

if __name__ == "__main__":
    get_location()

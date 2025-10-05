import requests
import json

from pathlib import Path

weather_json_path = Path.home() / ".config" / ".yasb" / "weather.json"


def get_location():
    data_keys = ["ip", "city", "region", "country", "loc"]
    url = "https://ipinfo.io"

    try:
        with open(weather_json_path, "r") as f:
            json_data = json.load(f)
    except:
        json_data = {}

    try:
        response = requests.get(url)
        match response.status_code:
            case 200:
                data = response.json()
                ip_json = {key: data[key] for key in data_keys}
                ip_json["loc"] = data["loc"].split(",")
            case _:
                raise Exception
    except Exception:
        ip_json = dict()

    json_data |= ip_json

    with open(weather_json_path, "w") as f:
        json.dump(json_data, f, indent=2)

    output = {key: json_data[key] for key in data_keys}
    print(json.dumps(output, indent=2))
    return output


if __name__ == "__main__":
    get_location()

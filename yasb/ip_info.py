import requests
import json

def get_location():
    url = "https://ipinfo.io"
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an HTTPError for bad responses (4xx and 5xx)
        data = response.json()
        return {
            "ip": data["ip"],
            "city": data["city"],
            "region": data["region"],
            "country": data["country"],
            "loc": data["loc"].split(",")
        }
    except requests.exceptions.RequestException as e:
        print(f"Error: {e}")
        file = open("weather.json")
        json_data = json.load(file)
        return json_data

if __name__ == "__main__":
    get_location()

import math
import sys
import time
import subprocess

def dual_brightness(brightness):
    first_brightness = min(max(0, brightness), 100)
    second_brightness = int(math.floor(1.2*first_brightness))
    second_brightness = min(max(0, second_brightness), 100)
    return (first_brightness, second_brightness)
    
def main(*args, **kwargs):
    t = int(args[0])
    time.sleep(t)
    subprocess.run([".\PSTools\psshutdown.exe", "-d", "-t", "0"])
    
if __name__ == "__main__":
    main(*sys.argv[1:])

# Icaro Figaro - RM 93571
# Cesar Norena - RM 95093
# Gustavo Jordao Santos - RM 93821

import json
import random
from datetime import datetime


def random_choice(size: int, choices: list) -> list:
    elements = []
    for i in range(0, size):
        element = random.choice(choices)
        elements.append(element)
    return elements


def random_passerby_list(size: int) -> list:
    # 0 none
    # 1 passersby
    return random_choice(size, [0, 1])


def random_vehicle_list(size: int) -> list:
    # 0 = none
    # 1 = motorcycle
    # 2 = vehicle
    # 3 = heavy_vehicle
    return random_choice(size, [0, 1, 2, 3])


def sec_to_min(sec: int) -> int:
    return int(sec / 60)


def is_motorcycle(vehicle: int) -> bool:
    return vehicle == 1


def is_vehicle(vehicle: int) -> bool:
    return vehicle == 2


def is_heavy_vehicle(vehicle: int) -> bool:
    return vehicle == 3


def is_passerby(passerby: int) -> bool:
    return passerby == 1


def print_statistics(statistics: dict):
    print("Time: ", statistics["time"])
    print("Elapsed time: ", statistics["elapsed_time_sec"], "seconds")
    print("Traffic light openings: ", statistics["traffic_light_openings"])
    print("Traffic light openings mean by minute: ", statistics["traffic_light_openings_mean_by_minute"])
    print("Motorcycle count: ", statistics["motorcycle_count"])
    print("Vehicle count: ", statistics["vehicle_count"])
    print("Heavy vehicle count: ", statistics["heavy_vehicle_count"])


def save_file(statistics: dict):
    with open("statistics.json", "w") as file:
        file.write(json.dumps(statistics, indent=4))


def should_open_traffic_light(passerby_count: int) -> bool:
    return passerby_count >= 8


def main():
    size = random.randrange(100, 1000)

    vehicles = random_vehicle_list(size)
    passersby = random_passerby_list(size)

    print("Vehicles: ", vehicles)
    print("Passersby: ", passersby)
    print()

    time = datetime.now()
    elapsed_time_sec = 0
    passersby_count = 0
    openings_count = 0
    motorcycle_count = 0
    vehicle_count = 0
    heavy_vehicle_count = 0

    for i in range(0, size):
        # Every iteration add 2 seconds to the time
        elapsed_time_sec += 2

        if is_motorcycle(vehicles[i]):
            motorcycle_count += 1

        if is_vehicle(vehicles[i]):
            vehicle_count += 1

        if is_heavy_vehicle(vehicles[i]):
            heavy_vehicle_count += 1

        if is_passerby(passersby[i]):
            passersby_count += 1

        # Semaphore open every 8 passersby
        if should_open_traffic_light(passersby_count):
            elapsed_time_sec += passersby_count * 2
            openings_count += 1
            passersby_count = 0

    elapsed_time_min = sec_to_min(elapsed_time_sec)
    openings_mean = openings_count / (elapsed_time_min + 1)

    statistics = {
        "time": str(time),
        "elapsed_time_sec": elapsed_time_sec,
        "traffic_light_openings": openings_count,
        "traffic_light_openings_mean_by_minute": openings_mean,
        "motorcycle_count": motorcycle_count,
        "vehicle_count": vehicle_count,
        "heavy_vehicle_count": heavy_vehicle_count,
    }

    print_statistics(statistics)
    save_file(statistics)


if __name__ == '__main__':
    main()

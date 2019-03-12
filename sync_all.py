#!/usr/local/bin/python3
import os
from multiprocessing import Process


TITAN_HOST = "nervana-titanxp10.fm.intel.com"


def system_process(command):
    os.system(command)


def sync(project_name, server_name=None, remote_home=None):
    p = Process(
        target=system_process,
        args=(f"./sync_rsync {project_name} {server_name} {remote_home}",),
    )
    p.start()
    return p


def main():
    processes = [
        sync("ai-lab-rl", TITAN_HOST, "/nfs/site/home/zdwiel"),
        sync("coach", TITAN_HOST, "/nfs/site/home/zdwiel"),
        sync("bottleneck", TITAN_HOST, "/nfs/site/home/zdwiel"),
        sync("hyper-visual", TITAN_HOST, "/nfs/site/home/zdwiel"),
        sync("flexible_robotics", TITAN_HOST, "/nfs/site/home/zdwiel"),
    ]

    for process in processes:
        process.join()


if __name__ == "__main__":
    main()

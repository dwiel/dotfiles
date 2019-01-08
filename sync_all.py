#!/usr/local/bin/python3
import os
from multiprocessing import Process


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
        sync("coach", "nervana-titanxp10.fm.intel.com", "/nfs/site/home/zdwiel"),
        sync("bottleneck", "nervana-titanxp10.fm.intel.com", "/nfs/site/home/zdwiel"),
    ]

    for process in processes:
        process.join()


if __name__ == "__main__":
    main()

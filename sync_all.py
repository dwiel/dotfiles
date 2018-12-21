#!/usr/bin/python
import os


def sync(project_name, server_name=None, remote_home=None):
    os.system(f"./sync_rsync {project_name} {server_name} {remote_home}")


def main():
    sync("coach", "nervana-titanxp10.fm.intel.com", "/nfs/site/home/zdwiel")


if __name__ == "__main__":
    main()

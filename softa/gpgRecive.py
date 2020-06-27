import re
import argparse
import os
import subprocess

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Tee jottai")
    parser.add_argument("pkgbuild")
    parser.add_argument("--dryrun", "-d", action="store_true")
    args = parser.parse_args()

    with open(args.pkgbuild, 'r') as f:
        # Nostaa FileNotFoundError jos ei löydy
        content = f.read().strip()
    commentless = re.sub(r'#.*$', '', content, flags=re.MULTILINE)
    valid = re.findall(r'validpgpkeys[ ]*[+]?=[ ]*\([^)]*\)', commentless)
    if not valid:
        raise ValueError("No valid pgp keys in file")

    possible_keys = []
    for possible_pgp_key in valid:
        possible_keys += re.findall(r'[A-F0-9]{40}', possible_pgp_key)
    for possible_key in possible_keys:
        command = ["gpg", "--recv-keys", possible_key]
        if args.dryrun:
            print(" ".join(command))
        else:
            subprocess.run(" ".join(command), shell=True, check=True)

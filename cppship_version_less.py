import sys
import subprocess


def main():
    cppship_version = subprocess.check_output('cppship --version', shell=True).decode('utf-8')
    version = sys.argv[1]

    v1 = [int(v) for v in cppship_version.split('.')]
    v2 = [int(v) for v in version.split('.')]
    exit(0 if v1 < v2 else -1)


if __name__ == '__main__':
    main()
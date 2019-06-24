from github import Github
import sys


def make():
    user = Github("YOUR_USERNAME", "YOUR_PASSWORD").get_user()
    repo = user.create_repo(name=sys.argv[1])
    print("Successfully created repo {}".format(sys.argv[1]))
    print(sys.argv[1])


if __name__ == '__main__':
    make()

import platform
import re
import sys
import os
import time


from selenium import webdriver


def make():
    path = os.getcwd() + '/chromedriver'

    driver = webdriver.Chrome(path)
    url = 'https://www.google.com'
    driver.get(url)
    time.sleep(5)


def test():
    os.system("export PATH={}:$PATH && echo $PATH".format(os.getcwd()))



if __name__ == '__main__':
    make()

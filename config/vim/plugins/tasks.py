from os import listdir
from os.path import isdir, join
from invoke import task

@task
def update(c):
    def add_comment(path):
        cmd = ''
        if isdir(join(path, '.git')):
            cmd = 'git pull'
        elif isdir(join(path, '.hg')):
            cmd = 'hg pull -u'
        return (path, cmd)

    dirs = [add_comment(d) for d in listdir('.') if isdir(d)]

    for path, cmd in dirs:
        if not cmd:
            continue

        with c.cd(path):
            print('Checking ' + path)
            c.run(cmd)

from datetime import datetime
import os
import time

myfile = "/mnt/azurefile/anotherfile"
current_time = time.time()

"""
Set the access time of a given filename to the given atime.
atime must be a datetime object.
"""
stat = os.stat(myfile)
mtime = stat.st_mtime
atime = stat.st_atime

print(mtime)
mtime = mtime - 3600.0
print(mtime)
os.utime(myfile, (atime - 3600.0, mtime))

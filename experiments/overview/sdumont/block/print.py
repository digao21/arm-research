from numpy import genfromtxt
import matplotlib.pyplot as plt

files = ['cache/probe2.csv', 'cache/probe3.csv', 'cache/probe5.csv']
colors = ['r', 'g', 'b', 'y', 'k']

size = []
time = []
gflops = []
chl1 = []
chl2 = []

for fileName in files:
  data   = genfromtxt(fileName, delimiter=';')

  size   = [num[0] for num in data]
  time   = [num[1] for num in data]
  gflops = [num[2] for num in data]
  chl1   = [num[3] for num in data]
  chl2   = [num[4] for num in data]

  color = colors.pop()

  plt.subplot(511)
  plt.ylabel('Time (s)')
  plt.plot(size, time, color)

  plt.subplot(512)
  plt.ylabel('Perf (GFlops)')
  plt.plot(size, gflops, color+'--')

  plt.subplot(513)
  plt.ylabel('Cache hit l1')
  plt.plot(size, chl1, color+'--')

  plt.subplot(514)
  plt.ylabel('Cache hit l2')
  plt.plot(size, chl2, color+'--')


files = ['ipc/probe2.csv', 'ipc/probe3.csv', 'ipc/probe5.csv']
colors = ['r', 'g', 'b', 'y', 'k']

size = []
time = []
gflops = []
ips = []

for fileName in files:
  data   = genfromtxt(fileName, delimiter=';')

  size   = [num[0] for num in data]
  ips    = [num[3] for num in data]

  color = colors.pop()

  plt.subplot(515)
  plt.ylabel('Inst. per cycle')
  plt.plot(size, ips, color+'--')

  plt.xlabel('Size (double)')

plt.show()

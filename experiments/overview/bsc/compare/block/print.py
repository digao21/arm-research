from numpy import genfromtxt
import matplotlib.pyplot as plt

files = ['merlin/cache.csv', 'jetson-tx/cache.csv']
colors = ['r', 'g']

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

  plt.subplot(611)
  plt.ylabel('Time (s)')
  plt.plot(size, time, color)

  plt.subplot(613)
  plt.ylabel('Perf (GFlops)')
  plt.plot(size, gflops, color+'--')

  plt.subplot(614)
  plt.ylabel('Cache hit l1')
  plt.plot(size, chl1, color+'--')

  plt.subplot(615)
  plt.ylabel('Cache hit l2')
  plt.plot(size, chl2, color+'--')

# Plot speedup
dataBsc = genfromtxt('merlin/cache.csv', delimiter=';')
dataSdm = genfromtxt('jetson-tx/cache.csv', delimiter=';')

size  = [num[0] for num in dataBsc]
time1 = [num[1] for num in dataBsc]
time2 = [num[1] for num in dataSdm]

speedup = []
for i in range(len(size)):
  speedup.append(time1[i]/time2[i])

plt.subplot(612)
plt.ylabel('Speedup')
plt.plot(size, speedup, 'b')

files = ['merlin/ipc.csv', 'jetson-tx/ipc.csv']
colors = ['r', 'g']

size = []
time = []
gflops = []
ips = []

for fileName in files:
  data   = genfromtxt(fileName, delimiter=';')

  size   = [num[0] for num in data]
  ips    = [num[3] for num in data]

  color = colors.pop()

  plt.subplot(616)
  plt.ylabel('Inst. per cycle')
  plt.plot(size, ips, color+'--')

  plt.xlabel('Size (double)')

plt.show()

class ContainerManager {
  Map containers = {};
  ContainerManager();

  void add(String name) {
    containers[name] = BorContainer(name: name);
  }

  void verify(String msg) {
    for (String container in msg.split(";")) {
      String name;
      String instruction;
      List data;
      data = container.split(":");
      name = data[0];
      if (!containers.containsKey(name)) {
        add(name);
      }
      instruction = data[1];
      data = data.sublist(2);
      switch (instruction) {
        case 'SET':
          double newTemp = double.parse(data[0]);

          containers[name].temp = newTemp;
          if (newTemp > containers[name].maxtemp) {
            containers[name].maxtemp = newTemp;
          }
          if (newTemp > containers[name].mintemp) {
            containers[name].mintemp = newTemp;
          }
          break;
      }
    }
  }
}

class BorContainer {
  String name;
  BorContainer({required this.name});
  double temp = 10;
  double maxtemp = 32;
  double mintemp = 0;
}

class Agent {
  final List<AgentInfo> agentinfo;

  Agent({
    required this.agentinfo,
  });

  factory Agent.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['data'] as List;
    List<AgentInfo> agentList = list.map((i) => AgentInfo.fromJson(i)).toList();
    return Agent(
      agentinfo: agentList,
    );
  }
}

class AgentInfo {
  final String uuid;
  final String displayName;
  final String description;
  final String bustPortrait;

  AgentInfo(
      {required this.uuid,
      required this.displayName,
      required this.description,
      required this.bustPortrait});

  factory AgentInfo.fromJson(Map<String, dynamic> parsedJson) {
    final uuid = parsedJson['uuid'] as String;
    final displayName = parsedJson['displayName'] as String;
    final description = parsedJson['description'] as String;
    final bustPortrait = parsedJson['bustPortrait'] ?? "Empty";

    return AgentInfo(
        uuid: uuid,
        displayName: displayName,
        description: description,
        bustPortrait: bustPortrait);
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'displayName': displayName,
      'description': description,
      'bustPortrait': bustPortrait,
    };
  }
}

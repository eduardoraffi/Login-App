

class JobInfo{
  final String companyName;
  final String jobType;
  final String jobDescription;

  JobInfo({this.companyName, this.jobType, this.jobDescription});
  @override
  String toString() {
    return '[companyName: $companyName\njobType: $jobType\njobDescription: $jobDescription]';
  }

  ///TODO: To future json server response
  factory JobInfo.fromJSON(Map<String, Object> data) => JobInfo(
      companyName: data['companyName'] as String,
      jobType: data['jobType'] as String,
      jobDescription: data['jobDescription'] as String
  );

  Map<String, dynamic> toJson() => {
    'companyName': companyName,
    'jobType': jobType,
    'jobDescription': jobDescription
  };
}
{{- $id := uuidv4 }}
{{- $ts := now }}
{{- $ip := generate "aws.ec2.ip_address" }}
{{- $pname := generate "process.name" }}
{{- $logstream := generate "aws.cloudwatch.log_stream" }}
{{- $hostname := generate "host.name" }}
{{- $agentId := generate "agent.id" }}{"id": "{{$id}}","timestamp": "{{generate "timestamp" | date "2006-01-02T15:04:05.000Z"}}", "body": {"message": "{{generate "message"}}"}, "aws.cloudwatch": {"log_stream": "{{$logstream}}","ingestion_time": "{{ $ts | date "2006-01-02T15:04:05.000Z" }}"},"cloud": {"region": "{{ generate "cloud.region" }}"},"log.file.path": "/var/log/messages/{{$logstream}}","input": {"type": "aws-cloudwatch"},"process": {"name": "{{ $pname }}"},"event": {"id": "{{ generate "event.id" }}","ingested": "{{ generate "event.ingested" | date "2006-01-02T15:04:05.000000000Z" }}","dataset": "generic"},"host": {"name": "{{$hostname}}"},"metrics": {"size": {{generate "metrics.size"}}, "tmin": {{generate "metrics.tmin"}}},"agent": {"id": "{{$agentId}}","name": "{{$hostname}}","type": "filebeat","version": "8.8.0","ephemeral_id": "{{$agentId}}"},"tags": ["preserve_original_event"], "trace_id":"{{ generate "trace_id" }}", "level": "{{ generate "level" }}"}
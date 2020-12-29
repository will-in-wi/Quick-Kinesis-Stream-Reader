# frozen_string_literal: true

require 'aws-sdk-kinesis'

STREAM_NAME = ENV['STREAM_NAME']
AFTER_TIMESTAMP = ENV['STARTING_TIME']

kinesis = Aws::Kinesis::Client.new

shards = kinesis.list_shards(
  stream_name: STREAM_NAME
)

shards[:shards].each do |data|
  shard_id = data[:shard_id]

  iter = kinesis.get_shard_iterator(
    stream_name: STREAM_NAME,
    shard_id: shard_id,
    shard_iterator_type: 'AT_TIMESTAMP',
    timestamp: Time.parse(AFTER_TIMESTAMP)
  )

  recs = kinesis.get_records(
    shard_iterator: iter[:shard_iterator]
  )

  recs[:records].each do |rec|
    puts rec[:data]
  end
end

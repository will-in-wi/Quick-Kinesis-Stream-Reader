# Quick Kinesis Stream Reader

Simple script for dumping data from a Kinesis stream since a particular time.

## Basic usage

```bash
git clone git@github.com:will-in-wi/Quick-Kinesis-Stream-Reader.git
cd Quick-Kinesis-Stream-Reader/
bundle install
STREAM_NAME="your-stream" STARTING_TIME="2020-12-25T14:30:00-06:00" bundle exec ruby main.rb
```

You can also pipe this to grep or dump it into a file for later processing.

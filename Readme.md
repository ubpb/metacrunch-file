metacrunch-file
===============

[![Gem Version](https://badge.fury.io/rb/metacrunch-file.svg)](http://badge.fury.io/rb/metacrunch-file)
[![Code Climate](https://codeclimate.com/github/ubpb/metacrunch-file/badges/gpa.svg)](https://codeclimate.com/github/ubpb/metacrunch-file)
[![Build Status](https://travis-ci.org/ubpb/metacrunch-file.svg)](https://travis-ci.org/ubpb/metacrunch-file)

This is the official file package for the [metacrunch ETL toolkit](https://github.com/ubpb/metacrunch).

Installation
------------

Include the gem in your `Gemfile`

```ruby
gem "metacrunch-file", "~> 1.0.0"
```

and run `$ bundle install` to install it.

Or install it manually

```
$ gem install metacrunch-file
```


Usage
-----

*Note: For working examples on how to use this package check out our [demo repository](https://github.com/ubpb/metacrunch-demo).*

### `Metacrunch::File::Source`

This class provides a metacrunch `source` implementation that can be used to read data from files in the file system into a metacrunch job. The class can be used to read regular files, compressed files (gzip), tar archives and compressed tar archives (gzip).

You can access non-option arguments from the command line using the `ARGV` constant.

```ruby
# my_job.metacrunch

# If you call this example like so
#   $ metacrunch my_job.metacrunch *.xml
# ARGV will contain all the XML files in the current directory.
source Metacrunch::File::Source.new(ARGV)

# ... or you can set the filenames directly
source Metacrunch::File::Source.new(["my-data.xml", "my-other-data.xml", "..."])
```

**Options**

NONE.

The source yields objects of type `Metacrunch::File::Entry` for every file it reads. 

```ruby
# my_job.metacrunch

transformation ->(file_entry) do
  puts "** Got file entry (Metacrunch::File::Entry)"
  puts "  Filename: #{file_entry.filename}"
  puts "  From archive?: #{file_entry.from_archive?}"
  puts "  Name in archive: #{file_entry.archive_filename || '-'}"
  puts "  Contents: #{file_entry.contents}"
end
```


metacrunch-file
===============

[![Gem Version](https://badge.fury.io/rb/metacrunch-file.svg)](http://badge.fury.io/rb/metacrunch-file)
[![Code Climate](https://codeclimate.com/github/ubpb/metacrunch-file/badges/gpa.svg)](https://codeclimate.com/github/ubpb/metacrunch-file)
[![Test Coverage](https://codeclimate.com/github/ubpb/metacrunch-file/badges/coverage.svg)](https://codeclimate.com/github/ubpb/metacrunch-file/coverage)
[![CircleCI](https://circleci.com/gh/ubpb/metacrunch-file.svg?style=svg)](https://circleci.com/gh/ubpb/metacrunch-file)

This is the official file package for the [metacrunch ETL toolkit](https://github.com/ubpb/metacrunch). 

*Note: For working examples on how to use this package check out our [demo repository](https://github.com/ubpb/metacrunch-demo).*


Installation
------------

Include the gem in your `Gemfile`

```ruby
gem "metacrunch-file", "~> 1.3.0"
```

and run `$ bundle install` to install it.

Or install it manually

```
$ gem install metacrunch-file
```


Usage
-----

## `Metacrunch::File::FileSource`

This class provides a metacrunch `source` implementation that can be used to read data from files in the file system into a metacrunch job. The class can be used to read regular files, compressed files (gzip), tar archives and compressed tar archives (gzip).

```ruby
# my_job.metacrunch

# If you call this example like so
#   $ metacrunch my_job.metacrunch *.xml
# ARGV will contain all the XML files in the current directory.
source Metacrunch::File::FileSource.new(ARGV)

# ... or you can set the filenames directly
source Metacrunch::File::FileSource.new(["my-data.xml", "my-other-data.xml", "..."])
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

## `Metacrunch::File::FileDestination`

This class provides a metacrunch `destination` to write data to a file. Every data that gets passed to the destination is appended to the given file. If the data is an `Array` every element of that array is appended to the file. Non existing files will be created automatically.

```ruby
# my_job.metacrunch

destination Metacrunch::File::FileDestination.new("/tmp/my-data.txt" [, OPTIONS])
```

**Options**

* `override_existing_file`: Overrides an existing file if set to `true`. If set to `false` an error is raised if the file already exists. Defaults to `false`.
* 

## `Metacrunch::File::XLSXDestination`

This class provides a metacrunch `destination` implementation to create simple Excel (xlsx) files.

To use this destination a transformation is required to format the data in a proper array that can be passed to the destination. When defining the destination you must provide an array of column names. Each data row passed to the destination must be an array of the same size as the column array.

```ruby
# my_job.metacrunch

transformation ->(data) do
  [data["foo"], data["bar"], ...]
end

destination Metacrunch::File::XLSXDestination.new(
    "/tmp/my-data.xlsx",           # filename
    ["Column 1", "Column 2", ...], # header columns
    OPTIONS
)
```

**Options**

* `worksheet_title`: The name of the worksheet. Defaults to `My data`.

License
-------

metacrunch-file is available at [github](https://github.com/ubpb/metacrunch-file) under [MIT license](https://github.com/ubpb/metacrunch-file/blob/master/License.txt).


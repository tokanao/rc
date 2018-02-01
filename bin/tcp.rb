#!/home/toka/.rbenv/shims/ruby

#require 'pry'

puts 'input args overwrite file name.' and exit if ARGV.size.zero?

ENV['TCP_SRC_PATH'] = '/home/toka/rails/sales_mng'

EXCLUDE_PATH = %w[vendor]


src_path = ENV['TCP_SRC_PATH']

ARGV.each do |filepath|
  filename = File.basename(filepath)

  Dir.glob("#{src_path}/**/#{filename}") do |f|
    next if EXCLUDE_PATH.any? { |path| f.include?(path) }

    cmd = "cp -i #{f} #{filepath}"
    puts cmd
    system(cmd)
    break
  end
end



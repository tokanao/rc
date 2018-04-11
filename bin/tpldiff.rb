#!/home/toka/.rbenv/shims/ruby

#require 'pry'

puts 'input args diff file name.' and exit if ARGV.size.zero?

ENV['TCP_SRC_PATH'] = '/home/toka/rails/sales_mng'
src_path = ENV['TCP_SRC_PATH']

EXCLUDE_PATH = %w[vendor]

filepath = ARGV[0]
filename = File.basename(filepath)

Dir.glob("#{src_path}/**/#{filename}") do |f|
  next if EXCLUDE_PATH.any? { |path| f.include?(path) }

  ret = `type colordiff 2> /dev/null`
  diff_cmd = ($?.exitstatus == 0 ? 'colordiff':'diff')
  cmd = "#{diff_cmd} -y #{f} #{filepath}"
  puts cmd
  system(cmd)
  break
end

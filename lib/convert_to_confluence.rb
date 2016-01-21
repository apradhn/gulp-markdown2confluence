require 'markdown2confluence'

begin
    if ARGV.size == 0
        Dir.glob('markdown/*.md') do |md_file|
            File.open(md_file, 'r') do |file|
                text = Kramdown::Document.new(file.read).to_confluence
                dest = md_file.sub('.md', '.confluence').sub('markdown', 'confluence')
                File.open(dest, 'w') { |file| file.write(text)}
                puts 'compiled markdown file to ' + dest
            end
        end 
    else
        begin
            File.open(ARGV[0], 'r') do |file|
            text = Kramdown::Document.new(file.read).to_confluence
            dest = '../confluence/' + ARGV[0].sub('.md', '.confluence')
            File.open(dest, 'w') { |file| file.write (text)}
            end
        rescue Exception => ex
          warn "There was an error running the convertor: \n#{ex}"
          puts ex.backtrace
          raise
        end
    end
rescue Exception => ex
    warn "There was an error running the convertor: \n#{ex}"
    puts ex.backtrace
    raise    
end